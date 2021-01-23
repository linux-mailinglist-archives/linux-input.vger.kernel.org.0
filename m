Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AD430157C
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 14:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbhAWNuI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 08:50:08 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:41467 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbhAWNuE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 08:50:04 -0500
Received: from envy.fritz.box ([82.207.207.243]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M6UqP-1l5nIh2JFx-006zHD; Sat, 23 Jan 2021 14:47:22 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, corbet@lwn.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/8] Updated documentation
Date:   Sat, 23 Jan 2021 14:47:10 +0100
Message-Id: <20210123134716.13414-3-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210123134716.13414-1-mail@richard-neumann.de>
References: <20210123134716.13414-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CqN9D5NKR9W/18gqX65jzgIY0q8fGPyuMKzax8Oqw9MfBNeJArt
 YRVKjKLN8iLshyQwUFxJh9f3APhH35U1lf8ksu3PSqAkPS7s627CT/BkEeiAjPQYFYFPNCg
 ZysG+r/HK2QSLtxiHwvJ73Y5sCVbgfHtc3JNH6Snm6/iX6OaLYS3orCp1/3VcMqrB0yh+s5
 H73dzFKn8T7TAC+oiYHYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:AEnt8cEvm2Y=:+oQb7qfqAG1W3usZil3mvq
 Qb/P5J/oFLeQwdfyhLtt4+miTsTseOGJVOiv+jYpMiSTU2weIzHg6P5c9fHuPMDJK1l/e+Of4
 UyhbLONsPZcPFhLKvWRGNrGSi6+w4xBwcModohf5SGttYbVL0JZDknHwxXUaxcryLlCf673/9
 eCCJrOGbLYafKDnhA74z3U52yyQ2oZQPUKWDOe+TDjn4ed7Q9nW6mm8jbYuV+jj0Fb1VhsVnR
 z69H7X7MPvD8RK2kVbnJLZqpKcwf4gxxPadUpIETeCIrUw3uykfqHtb5VhK4yPFd0aHOssVZf
 3Nj0sQ7P+Ow2X8y4M5abtyBD1JQeHyRYJ4H3RUJ5BrpRt+9AIoSjSJwENB7VM0RCfXYG/zr81
 luYkJ1gAGXutU//nbCyUyHxEiminzc8gH8ALesiCfANfBH/tnk590jp9Pg06DtXiQwHzBUgfI
 u+eohecbqw==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Updated documentation of the AMD Sensor Fusion Hub.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 Documentation/hid/amd-sfh-hid.rst | 275 ++++++++++++++----------------
 1 file changed, 131 insertions(+), 144 deletions(-)

diff --git a/Documentation/hid/amd-sfh-hid.rst b/Documentation/hid/amd-sfh-hid.rst
index 1f2fe29ccd4f..d68ba2b85d1e 100644
--- a/Documentation/hid/amd-sfh-hid.rst
+++ b/Documentation/hid/amd-sfh-hid.rst
@@ -1,145 +1,132 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-
-AMD Sensor Fusion Hub
-=====================
-AMD Sensor Fusion Hub (SFH) is part of an SOC starting from Ryzen based platforms.
-The solution is working well on several OEM products. AMD SFH uses HID over PCIe bus.
-In terms of architecture it resembles ISH, however the major difference is all
-the HID reports are generated as part of the kernel driver.
-
-1. Block Diagram
-================
-
-::
-
-	---------------------------------
-	|  HID User Space Applications  |
-	- -------------------------------
-
-    ---------------------------------------------
-	 ---------------------------------
-	|		HID Core          |
-	 ---------------------------------
-
-	 ---------------------------------
-	|     AMD HID Transport           |
-	 ---------------------------------
-
-	 --------------------------------
-	|             AMD HID Client     |
-	|	with HID Report Generator|
-	 --------------------------------
-
-	 --------------------------------
-	|     AMD MP2 PCIe Driver        |
-	 --------------------------------
-    OS
-    ---------------------------------------------
-    Hardware + Firmware
-         --------------------------------
-         |     SFH MP2 Processor         |
-         --------------------------------
-
-
-AMD HID Transport Layer
------------------------
-AMD SFH transport is also implemented as a bus. Each client application executing in the AMD MP2 is
-registered as a device on this bus. Here: MP2 which is an ARM core connected to x86 for processing
-sensor data. The layer, which binds each device (AMD SFH HID driver) identifies the device type and
-registers with the hid core. Transport layer attach a constant "struct hid_ll_driver" object with
-each device. Once a device is registered with HID core, the callbacks provided via this struct are
-used by HID core to communicate with the device. AMD HID Transport layer implements the synchronous calls.
-
-AMD HID Client Layer
+========================================
+Kernel drivers: amd-sfh-pci, amd-sfh-hid
+========================================
+
+Supported adapters:
+  * AMD Sensor Fusion Hub PCIe interface
+
+Datasheet: not publicly available.
+
+Authors:
+        - Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+        - Nehal Bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
+        - Sandeep Singh <sandeep.singh@amd.com>
+        - Richard Neumann <mail@richard-neumann.de>
+
+Description
+===========
+The AMD Sensor Fushion Hub (SFH) is part of a SOC on Ryzen-based platforms.
+The SFH uses HID over PCIe bus. In terms of architecture it is much more
+resmebles like ISH. However the major difference is, that currently HID reports
+are being generated within the kernel driver.
+
+Block Diagram
+-------------
+.. code-block:: none
+
+    +-------------------------------+
+    |  HID User Space Applications  |
+    +-------------------------------+
+    =================================
+    +-------------------------------+
+    |      HID low-level driver     |
+    |   with HID report generator   |
+    +-------------------------------+
+
+    +-------------------------------+
+    |      HID platform driver      |
+    +-------------------------------+
+
+    +-------------------------------+
+    |      AMD SFH PCIe driver      |
+    +-------------------------------+
+    =================================
+    +-------------------------------+
+    |       SFH MP2 Processor       |
+    +-------------------------------+
+
+HID low-level driver
 --------------------
-This layer is responsible to implement HID request and descriptors. As firmware is OS agnostic, HID
-client layer fills the HID request structure and descriptors. HID client layer is complex as it is
-interface between MP2 PCIe layer and HID. HID client layer initialized the MP2 PCIe layer and holds
-the instance of MP2 layer. It identifies the number of sensors connected using MP2-PCIe layer. Base
-on that allocates the DRAM address for each and every sensor and pass it to MP2-PCIe driver.On
-enumeration of each the sensor, client layer fills the HID Descriptor structure and HID input repor
-structure. HID Feature report structure is optional. The report descriptor structure varies from
-sensor to sensor.
-
-AMD MP2 PCIe layer
-------------------
-MP2 PCIe Layer is responsible for making all transactions with the firmware over PCIe.
-The connection establishment between firmware and PCIe happens here.
-
-The communication between X86 and MP2 is split into three parts.
-1. Command transfer via the C2P mailbox registers.
-2. Data transfer via DRAM.
-3. Supported sensor info via P2C registers.
-
-Commands are sent to MP2 using C2P Mailbox registers. Writing into C2P Message registers generate
-interrupt to MP2. The client layer allocates the physical memory and the same is sent to MP2 via
-the PCI layer. MP2 firmware writes the command output to the access DRAM memory which the client
-layer has allocated. Firmware always writes minimum of 32 bytes into DRAM. So as a protocol driver
-shall allocate minimum of 32 bytes DRAM space.
-
-Enumeration and Probing flow
-----------------------------
-::
-
-       HID             AMD            AMD                       AMD -PCIe             MP2
-       Core         Transport      Client layer                   layer                FW
-        |		|	       |                           |                 |
-        |		|              |                 on Boot Driver Loaded       |
-        |		|	       |                           |                 |
-        |		|	       |                        MP2-PCIe Int         |
-        |		|              |			   |                 |
-        |		|	       |---Get Number of sensors-> |                 |
-        |		|              |                       Read P2C              |
-        |		|	       |			Register             |
-        |		|              |                           |                 |
-        |               |              | Loop(for No of Sensors)   |                 |
-        |		|	       |----------------------|    |                 |
-        |		|              | Create HID Descriptor|    |                 |
-        |		|	       | Create Input  report |    |                 |
-        |		|              |  Descriptor Map      |    |                 |
-        |		|	       |  the MP2 FW Index to |    |                 |
-        |		|              |   HID Index          |    |                 |
-        |		|	       | Allocate the DRAM    |  Enable              |
-        |		|	       |	address       |  Sensors             |
-        |		|              |----------------------|    |                 |
-        |		| HID transport|                           |    Enable       |
-        |	        |<--Probe------|                           |---Sensor CMD--> |
-        |		| Create the   |			   |                 |
-        |		| HID device   |                           |                 |
-        |               |    (MFD)     |                           |                 |
-        |		| by Populating|			   |                 |
-        |               |  the HID     |                           |                 |
-        |               |  ll_driver   |                           |                 |
-        | HID           |	       |			   |                 |
-        |  add          |              |                           |                 |
-        |Device         |              |                           |                 |
-        |<------------- |	       |			   |                 |
-
-
-Data Flow from Application to the AMD SFH Driver
-------------------------------------------------
-
-::
-
-	        |	       |              |	  	 	          |		    |
-                |	       |	      |			          |                 |
-                |	       |	      |			          |                 |
-                |              |              |                           |                 |
-                |              |              |                           |                 |
-                |HID_req       |              |                           |                 |
-                |get_report    |              |                           |                 |
-                |------------->|              |                           |                 |
-	        |              | HID_get_input|                           |                 |
-	        |              |  report      |                           |                 |
-	        |              |------------->|------------------------|  |                 |
-	        |              |              |  Read the DRAM data for|  |                 |
-	        |              |              |  requested sensor and  |  |                 |
-	        |              |              |  create the HID input  |  |                 |
-	        |              |              |  report                |  |                 |
-	        |              |              |------------------------|  |                 |
-	        |              |Data received |                           |                 |
-	        |              | in HID report|                           |                 |
-    To	        |<-------------|<-------------|                           |                 |
-    Applications|              |              |                           |                 |
-        <-------|              |              |                           |                 |
+The driver is conceived in a multi-layer architecture.
+The level closest to the applications is the HID low-level (LL) driver,
+which implements the functions defined by the hid-core API to manage the
+respective HID devices and process reports.
+Therefor, the HID-LL-driver starts and stops the sensors as needed by invoking
+the exposed functions from the PCI driver (see below) and creates DMA mappings
+to access the DRAM of the PCI device to retrieve feature and input reports
+from it.
+
+HID platform driver (`amd-sfh-hid`)
+-----------------------------------
+The aforementioned HID devices are being managed, i.e. created on probing and
+destroyed on removing, by the platform driver. It is being loaded through ACPI
+table matching if the PCI driver was loaded successfully.
+It determines the HID devices to be created on startup using the connected
+sensors bitmask retrieved by invoking the respective function of the PCI driver.
+On some systems the firmware does not provide the information about sensors
+connected to the SFH device. In this case, the detected sensors can be manually
+overridden by setting the driver's module parameter `sensor_mask=<int>`.
+
+PCI device driver (`amd-sfh-pci`)
+---------------------------------
+The PCI driver is responsible for making all transaction with the chip's
+firmware over PCI-e.
+The sensors are being started and stopped respectively by writing commands
+and, where applicable, DRAM addresses to certain device registers.
+The sensor's input report data can then be accessed by accessing the DRAM
+through DMA-mapped virtual addresses. Commands are sent to the device using C2P
+mail box registers. These C2P registers are mapped in PCIe address space.
+Writing into the device message registers generates interrupts. The device's
+firmware uses DRAM interface registers to indirectly access DRAM memory. It is
+recommended to always write a minimum of 32 bytes into the DRAM.
+
+Driver loading
+--------------
+
++------------+-----------------+----------------------+
+| PCI driver | Platform driver | HID low-level driver |
++============+=================+======================+
+| Loaded at boot time if       | Used by spawned HIDs |
+| device is present.           |                      |
++------------------------------+----------------------+
+
+Data flow table
+---------------
+.. code-block:: none
+
+                                                 +===============================================+
+    +============+        Get sensor mask        |                Platform driver                |
+    | PCI driver | <---------------------------- +===============================================+
+    +============+    of available HID devices   | * Probe HID devices according to sensor mask. |
+          ^                                      | * Start periodical polling from DRAM.         |
+          |                                      +-----------------------------------------------+
+ Start / stop sensor on                                                 |
+ respective HID requsts.                                                |
+          |                +==============================+             |
+          |                |        HID ll-driver         |             |
+          +--------------- +==============================+ <-----------+
+                           | Provide reports as requested |
+                           | by hid-code.                 |
+                           +------------------------------+
+
+Quirks
+------
+On some systems, the sensor hub has not been programmed with information about
+the sensors active on the device. This results in no sensors bein activated and
+no HID devices being spawned by the driver. To manually active the respective
+sensors, you can load the module `amd-sfh-hid` with the kernel parameter
+`sensor_mask=<int>`. The available sensors are currently:
+
++----------------------+----------+
+|        sensor        |   mask   |
++======================+==========+
+| accelerometer        |  BIT(0)  |
+| gyroscope            |  BIT(1)  |
+| magnetometer         |  BIT(2)  |
+| ambient light sensor |  BIT(19) |
++----------------------+----------+
+
+To enable e.g. only the accelerometer:
+
+    $ cat /etc/modprobe.d/amd_sfh.conf
+    options amd_sfh_hid sensor_mask=1
-- 
2.30.0

