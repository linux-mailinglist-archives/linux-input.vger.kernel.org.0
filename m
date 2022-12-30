Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D81653E84
	for <lists+linux-input@lfdr.de>; Thu, 22 Dec 2022 11:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiLVKsK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Dec 2022 05:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbiLVKsJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Dec 2022 05:48:09 -0500
X-Greylist: delayed 176 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Dec 2022 02:48:07 PST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.161])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B499227907
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 02:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1671705727;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=/Fn2+ItX52zP/7/Zh5YkeNhH3usYa/D+bF8oIAtP+YI=;
    b=RPyJQ4JA25m7Zc1V4PRs3qHyNAG5B19aAB8UwMlhfefIJOS4861zOShd3VyCAAIXDg
    QMmsAfR25VoQqrrHrB/6mqkbAnhwHiZPvVYRkdXSr20zt6A3Zn8zcF4mH1IP6g/9GFm2
    FKBWFIYn71mehKmBdQ+rxpIHAwsXZjum4MKBzKXb16EiiFVEoWYR9qaDFOomd/VAA6bL
    k44b/+eyplOU5eEr5Ym9y37/YdMTEd7HFokb+ala2Eo0WfdGMW/3hRKKgSwRaT51vzPy
    d00Tya/21JhySi1Nn3aCjIx6RHAy2dlEolYsnHWD6LLYwLbAr4Dwz3DwC5DRRM9vDdu3
    e0zw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjQ4EoIjqR3pZ8rPGEXjzEWc+eGtQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:59bc:ad4d:fc2c:81d1]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdyBMAg6xgk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 22 Dec 2022 11:42:06 +0100 (CET)
Message-ID: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
Date:   Thu, 22 Dec 2022 11:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To:     anpatel@nvidia.com, jkosina@suse.cz, linux-input@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Darren Stevens <darren@stevens-zone.net>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PASEMI] Nemo board doesn't reboot anymore after the commit "HID:
 usbhid: Add ALWAYS_POLL quirk for some mice"
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

The Nemo board [1] doesn't reboot anymore since the final kernel 6.1. 
The reboot works with the RC8 of kernel 6.1.
Actually, a reboot works but the CFE firmware is not loaded. Maybe there 
is still something in the memory after the reboot.

I bisected today. [2]

The commit "HID: usbhid: Add ALWAYS_POLL quirk for some mice". [3] is 
the problem.

I was able to revert this commit and the reboot works without any 
problems again.

I created a patch for reverting the bad commit. [4]

Then compiled the kernel with this patch. After that, the X1000 reboots 
without any problems.

I use a Cherry USB mouse. [5]

Please check the bad commit.

Thanks,
Christian


[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
[2] https://forum.hyperion-entertainment.com/viewtopic.php?p=56303#p56303
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.1&id=f6d910a89a2391e5ce1f275d205023880a33d3f8
[4] usbhid.patch:

diff -rupN a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
--- a/drivers/hid/hid-ids.h    2022-12-22 10:24:06.842881276 +0100
+++ b/drivers/hid/hid-ids.h    2022-12-22 10:23:35.903328869 +0100
@@ -274,7 +274,6 @@
  #define USB_DEVICE_ID_CH_AXIS_295    0x001c

  #define USB_VENDOR_ID_CHERRY        0x046a
-#define USB_DEVICE_ID_CHERRY_MOUSE_000C    0x000c
  #define USB_DEVICE_ID_CHERRY_CYMOTION    0x0023
  #define USB_DEVICE_ID_CHERRY_CYMOTION_SOLAR    0x0027

@@ -919,7 +918,6 @@
  #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER    0x02fd
  #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
  #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
-#define USB_DEVICE_ID_MS_MOUSE_0783      0x0783

  #define USB_VENDOR_ID_MOJO        0x8282
  #define USB_DEVICE_ID_RETRO_ADAPTER    0x3201
@@ -1388,7 +1386,6 @@

  #define USB_VENDOR_ID_PRIMAX    0x0461
  #define USB_DEVICE_ID_PRIMAX_MOUSE_4D22    0x4d22
-#define USB_DEVICE_ID_PRIMAX_MOUSE_4E2A    0x4e2a
  #define USB_DEVICE_ID_PRIMAX_KEYBOARD    0x4e05
  #define USB_DEVICE_ID_PRIMAX_REZEL    0x4e72
  #define USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4D0F    0x4d0f
diff -rupN a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
--- a/drivers/hid/hid-quirks.c    2022-12-22 10:24:06.844881247 +0100
+++ b/drivers/hid/hid-quirks.c    2022-12-22 10:23:35.904328855 +0100
@@ -54,7 +54,6 @@ static const struct hid_device_id hid_qu
      { HID_USB_DEVICE(USB_VENDOR_ID_CH, 
USB_DEVICE_ID_CH_FLIGHT_SIM_YOKE), HID_QUIRK_NOGET },
      { HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_PEDALS), 
HID_QUIRK_NOGET },
      { HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_THROTTLE), 
HID_QUIRK_NOGET },
-    { HID_USB_DEVICE(USB_VENDOR_ID_CHERRY, 
USB_DEVICE_ID_CHERRY_MOUSE_000C), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 
USB_DEVICE_ID_CORSAIR_K65RGB), HID_QUIRK_NO_INIT_REPORTS },
      { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 
USB_DEVICE_ID_CORSAIR_K65RGB_RAPIDFIRE), HID_QUIRK_NO_INIT_REPORTS | 
HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, 
USB_DEVICE_ID_CORSAIR_K70RGB), HID_QUIRK_NO_INIT_REPORTS },
@@ -123,7 +122,6 @@ static const struct hid_device_id hid_qu
      { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 
USB_DEVICE_ID_LOGITECH_MOUSE_C05A), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 
USB_DEVICE_ID_LOGITECH_MOUSE_C06A), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_MCS, 
USB_DEVICE_ID_MCS_GAMEPADBLOCK), HID_QUIRK_MULTI_INPUT },
-    { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
USB_DEVICE_ID_MS_MOUSE_0783), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
USB_DEVICE_ID_MS_PIXART_MOUSE), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
USB_DEVICE_ID_MS_POWER_COVER), HID_QUIRK_NO_INIT_REPORTS },
      { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, 
USB_DEVICE_ID_MS_SURFACE3_COVER), HID_QUIRK_NO_INIT_REPORTS },
@@ -148,7 +146,6 @@ static const struct hid_device_id hid_qu
      { HID_USB_DEVICE(USB_VENDOR_ID_PIXART, 
USB_DEVICE_ID_PIXART_OPTICAL_TOUCH_SCREEN), HID_QUIRK_NO_INIT_REPORTS },
      { HID_USB_DEVICE(USB_VENDOR_ID_PIXART, 
USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
USB_DEVICE_ID_PRIMAX_MOUSE_4D22), HID_QUIRK_ALWAYS_POLL },
-    { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
USB_DEVICE_ID_PRIMAX_MOUSE_4E2A), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4D0F), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4D65), HID_QUIRK_ALWAYS_POLL },
      { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, 
USB_DEVICE_ID_PRIMAX_PIXART_MOUSE_4E22), HID_QUIRK_ALWAYS_POLL },

[5]

Bus 003 Device 002: ID 046a:000c Cherry GmbH
Couldn't open device, some information will be missing
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x046a Cherry GmbH
   idProduct          0x000c
   bcdDevice            8.10
   iManufacturer           0
   iProduct                0
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0022
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      1 Boot Interface Subclass
       bInterfaceProtocol      2 Mouse
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.00
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength      52
          Report Descriptors:
            ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              10

