"use client";
import { theme } from '@/components/theme'
import { Box } from '@chakra-ui/react'
import { ChakraProvider } from '@chakra-ui/react'

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>
      <ChakraProvider theme={theme}>
        <Box>{children}</Box>
    </ChakraProvider>
      </body>
    </html>
  )
}
