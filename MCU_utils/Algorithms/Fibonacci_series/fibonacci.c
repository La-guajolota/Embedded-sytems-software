/*
 * ============================================================================
 * File: fibonacci.c
 * Author: Adrián Silva Palafox
 * Date: 2024-09-08
 * Description:
 *     This file contains the implementation of two different approaches to
 *     calculating the Fibonacci sequence. The first approach (`EXAMPLE0`)
 *     simulates the computation as if it were being performed by hardware
 *     registers in a Register Transfer Level (RTL) style, similar to VHDL.
 *     The second approach (`EXAMPLE1`) represents a more conventional
 *     computer programming style.
 *
 *     The first example (`EXAMPLE0`) uses an array to simulate hardware registers
 *     and iteratively calculates Fibonacci numbers, demonstrating how a hardware
 *     description language (HDL) might handle the Fibonacci sequence with
 *     register shifts and summation.
 *
 *     The second example (`EXAMPLE1`) uses a recursive function to compute Fibonacci
 *     numbers, reflecting a common approach in high-level programming for calculating
 *     Fibonacci sequences.
 *
 * Example Usage:
 *     To compile and run the code, use the following commands:
 *     - Compile: gcc -o fibonacci fibonacci.c
 *     - Run: ./fibonacci
 *
 *     Uncomment the desired function call in `main()` to see the output:
 *     - To see the hardware-style approach: Uncomment `EXAMPLE0();`
 *     - To see the programming-style approach: Uncomment `EXAMPLE1(0, 1);`
 *
 * Functions:
 *     - void EXAMPLE0(void): Simulates Fibonacci computation using hardware-style
 *       register operations. Demonstrates register shifts and summation.
 *     - void EXAMPLE1(uint8_t a, uint8_t b): Computes Fibonacci numbers using
 *       recursion. Illustrates a conventional programming approach.
 *
 * Dependencies:
 *     - Standard C Library (for I/O operations)
 *
 * License:
 *
 * ============================================================================
 */
#include <stdio.h>
#include <stdint.h>

#define Fibonacci_num 10 // Number of Fibonacci numbers to be calculated

// Function prototypes
void EXAMPLE0(void);             // Hardware-style register simulation
void EXAMPLE1(uint8_t, uint8_t); // Recursive Fibonacci calculation

int main()
{
    // Uncomment the function you want to execute

    EXAMPLE0(); // Uncomment to run the hardware-style approach
    // EXAMPLE1(0, 1); // Uncomment to run the recursive programming-style approach

    return 0;
}

/**
 * @brief
 *     Simulates Fibonacci sequence computation using a hardware-style approach.
 *     The function uses an array to mimic hardware registers and performs
 *     the Fibonacci calculation in a manner similar to Register Transfer Level
 *     (RTL) in hardware description languages (HDLs) such as VHDL.
 *     The function demonstrates the shifting of register values and summation
 *     of Fibonacci numbers.
 */
void EXAMPLE0(void)
{
    // Initialize registers with starting values
    uint8_t fib_regs[3] = {0, 1, 0};

    // Compute Fibonacci numbers using register operations
    for (int i = 0; i < Fibonacci_num; i++)
    {
        // Perform summation: fib_regs[2] = fib_regs[1] + fib_regs[0]
        fib_regs[2] = fib_regs[1] + fib_regs[0];
        printf("Fibonacci_%d: %d\n", i, fib_regs[0]); // Output current Fibonacci number

        // Perform register shifts
        fib_regs[0] = fib_regs[1];
        fib_regs[1] = fib_regs[2];
    }
}

/**
 * @brief
 *     Computes Fibonacci numbers using a recursive approach. This function
 *     demonstrates a conventional programming style where recursion is used
 *     to compute the Fibonacci sequence. The function prints each computed
 *     value and terminates recursion when the value exceeds 100.
 *
 * @param a The first Fibonacci number in the pair to be summed.
 * @param b The second Fibonacci number in the pair to be summed.
 */
void EXAMPLE1(uint8_t a, uint8_t b)
{
    uint8_t r = b + a;
    printf("Fibonacci_num: %d\n", r);

    if (r > 100)
    {
        return; // Exit the recursion if the value exceeds 100
    }
    else
    {
        EXAMPLE1(b, r); // Recursive call to compute the next Fibonacci number
    }
}