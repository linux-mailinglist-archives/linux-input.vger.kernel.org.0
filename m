Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22872308337
	for <lists+linux-input@lfdr.de>; Fri, 29 Jan 2021 02:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhA2B0q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 20:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhA2B0m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 20:26:42 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5460FC061574;
        Thu, 28 Jan 2021 17:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=OjJIGxFl6+sb3eeDTK3sXsJ5okb2ytnpBeIGODGtFUI=; b=hX6AnXiHKjXIyUUdEfwlrakVpj
        7FPev4on6u8y4H9guloiKfd3EReYmnwz/z9KQ61B4D+2WEukVYUXoVYDAJ/7ahsCFjfgpzPs8AFZg
        8WNT6CITNo/GkyoAo/ET8P18q68K1wvVXf9DJt5dsWZSBbRFqoiZrRlf/PRSsfrmxydOghX4ECh6O
        jiFox0G2QojZr5RqiySgCPJVVTUsBAy4noAeyBDp7WTeY/ljsoLgQzilrNdnwqipf0ekvpRL8dWoB
        19XJabl24FOlWpW/AR9zNLNi0Ze+QwPHl0VU9mO3wbAIdLNbuwujXUPe4e16WBqmtneRP+VmZoCuM
        rUjx8O9w==;
Received: from [2601:1c0:6280:3f0::7650]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l5IXu-0000Pq-Ux; Fri, 29 Jan 2021 01:25:59 +0000
Subject: Re: [PATCH v9 2/8] Updated documentation
To:     mail@richard-neumann.de, nehal-bakulchandra.shah@amd.com,
        sandeep.singh@amd.com, corbet@lwn.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210123134716.13414-1-mail@richard-neumann.de>
 <20210123134716.13414-3-mail@richard-neumann.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <650cef6a-6e7c-8fe9-ef48-a0efacfcf9f8@infradead.org>
Date:   Thu, 28 Jan 2021 17:25:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210123134716.13414-3-mail@richard-neumann.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 1/23/21 5:47 AM, mail@richard-neumann.de wrote:
> From: Richard Neumann <mail@richard-neumann.de>
> 
> Updated documentation of the AMD Sensor Fusion Hub.
> 
> Signed-off-by: Richard Neumann <mail@richard-neumann.de>
> ---
>  Documentation/hid/amd-sfh-hid.rst | 275 ++++++++++++++----------------
>  1 file changed, 131 insertions(+), 144 deletions(-)
> 
> diff --git a/Documentation/hid/amd-sfh-hid.rst b/Documentation/hid/amd-sfh-hid.rst
> index 1f2fe29ccd4f..d68ba2b85d1e 100644
> --- a/Documentation/hid/amd-sfh-hid.rst
> +++ b/Documentation/hid/amd-sfh-hid.rst
> @@ -1,145 +1,132 @@

[snip deletions]

> +========================================
> +Kernel drivers: amd-sfh-pci, amd-sfh-hid
> +========================================
> +
> +Supported adapters:
> +  * AMD Sensor Fusion Hub PCIe interface
> +
> +Datasheet: not publicly available.
> +
> +Authors:
> +        - Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +        - Nehal Bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
> +        - Sandeep Singh <sandeep.singh@amd.com>
> +        - Richard Neumann <mail@richard-neumann.de>
> +
> +Description
> +===========
> +The AMD Sensor Fushion Hub (SFH) is part of a SOC on Ryzen-based platforms.

                  Fusion

> +The SFH uses HID over PCIe bus. In terms of architecture it is much more

                                                            it resembles the

> +resmebles like ISH. However the major difference is, that currently HID reports

   ISH. However, the major difference is that currently HID reports

> +are being generated within the kernel driver.
> +
> +Block Diagram
> +-------------
> +.. code-block:: none
> +
> +    +-------------------------------+
> +    |  HID User Space Applications  |
> +    +-------------------------------+
> +    =================================
> +    +-------------------------------+
> +    |      HID low-level driver     |
> +    |   with HID report generator   |
> +    +-------------------------------+
> +
> +    +-------------------------------+
> +    |      HID platform driver      |
> +    +-------------------------------+
> +
> +    +-------------------------------+
> +    |      AMD SFH PCIe driver      |
> +    +-------------------------------+
> +    =================================
> +    +-------------------------------+
> +    |       SFH MP2 Processor       |
> +    +-------------------------------+
> +
> +HID low-level driver
>  --------------------

[snip deletions]

> +The driver is conceived in a multi-layer architecture.
> +The level closest to the applications is the HID low-level (LL) driver,
> +which implements the functions defined by the hid-core API to manage the
> +respective HID devices and process reports.
> +Therefor, the HID-LL-driver starts and stops the sensors as needed by invoking
> +the exposed functions from the PCI driver (see below) and creates DMA mappings
> +to access the DRAM of the PCI device to retrieve feature and input reports
> +from it.
> +
> +HID platform driver (`amd-sfh-hid`)
> +-----------------------------------
> +The aforementioned HID devices are being managed, i.e. created on probing and
> +destroyed on removing, by the platform driver. It is being loaded through ACPI

                           better:                It is loaded through ACPI

> +table matching if the PCI driver was loaded successfully.
> +It determines the HID devices to be created on startup using the connected
> +sensors bitmask retrieved by invoking the respective function of the PCI driver.
> +On some systems the firmware does not provide the information about sensors
> +connected to the SFH device. In this case, the detected sensors can be manually
> +overridden by setting the driver's module parameter `sensor_mask=<int>`.
> +
> +PCI device driver (`amd-sfh-pci`)
> +---------------------------------
> +The PCI driver is responsible for making all transaction with the chip's

                                                transactions

> +firmware over PCI-e.
> +The sensors are being started and stopped respectively by writing commands

   The sensors are started and stopped

> +and, where applicable, DRAM addresses to certain device registers.
> +The sensor's input report data can then be accessed by accessing the DRAM
> +through DMA-mapped virtual addresses. Commands are sent to the device using C2P
> +mail box registers. These C2P registers are mapped in PCIe address space.

what is C2P?

> +Writing into the device message registers generates interrupts. The device's
> +firmware uses DRAM interface registers to indirectly access DRAM memory. It is
> +recommended to always write a minimum of 32 bytes into the DRAM.
> +
> +Driver loading
> +--------------
> +
> ++------------+-----------------+----------------------+
> +| PCI driver | Platform driver | HID low-level driver |
> ++============+=================+======================+
> +| Loaded at boot time if       | Used by spawned HIDs |
> +| device is present.           |                      |
> ++------------------------------+----------------------+
> +
> +Data flow table
> +---------------
> +.. code-block:: none
> +
> +                                                 +===============================================+
> +    +============+        Get sensor mask        |                Platform driver                |
> +    | PCI driver | <---------------------------- +===============================================+
> +    +============+    of available HID devices   | * Probe HID devices according to sensor mask. |
> +          ^                                      | * Start periodical polling from DRAM.         |

                                                              periodic

> +          |                                      +-----------------------------------------------+
> + Start / stop sensor on                                                 |
> + respective HID requsts.                                                |

                   requests.

> +          |                +==============================+             |
> +          |                |        HID ll-driver         |             |
> +          +--------------- +==============================+ <-----------+
> +                           | Provide reports as requested |
> +                           | by hid-code.                 |
> +                           +------------------------------+
> +
> +Quirks
> +------
> +On some systems, the sensor hub has not been programmed with information about
> +the sensors active on the device. This results in no sensors bein activated and

                                                                being

> +no HID devices being spawned by the driver. To manually active the respective

                                                           activate

> +sensors, you can load the module `amd-sfh-hid` with the kernel parameter
> +`sensor_mask=<int>`. The available sensors are currently:
> +

How about adding a "value" column and an example?

> ++----------------------+----------+
> +|        sensor        |   mask   |  value
> ++======================+==========+
> +| accelerometer        |  BIT(0)  |    1
> +| gyroscope            |  BIT(1)  |    2
> +| magnetometer         |  BIT(2)  |    4
> +| ambient light sensor |  BIT(19) | 524288
> ++----------------------+----------+

The values are additive, so to enable the gyroscope and the
ambient light sensor, use a value of 524290.

> +
> +To enable e.g. only the accelerometer:
> +
> +    $ cat /etc/modprobe.d/amd_sfh.conf
> +    options amd_sfh_hid sensor_mask=1
> 


HTH.
-- 
~Randy

