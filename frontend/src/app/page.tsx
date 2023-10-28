

import { Flex, Spacer, Text, Box } from '@chakra-ui/react'

export default function Home() {
  return (
    <Box bg={`bg.100`}>
      //navbar
    <Flex >

    </Flex>
    <Flex bg={`bg.100`}>
        <Flex>

          <Flex bg={`primary.100`} direction={`column`} wrap={`nowrap`}>
            <Text>Discover Digital Art & collect NFTs</Text>
            <Text>NFT Marketplace UI created with Anima For Figma. Dollect, Buy and Sell Art From More than 20k NFT Artists.</Text>
            <button>Get Started</button>
          </Flex>

          <Flex direction={`row`}>
              <Text>240k+</Text>
              <Text>240k+</Text>
              <Text>240k+</Text>
          </Flex>

        </Flex>
        <Flex>

        </Flex>
    </Flex>
    </Box>
   
  )
}
