Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77205628160
	for <lists+linux-input@lfdr.de>; Mon, 14 Nov 2022 14:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236797AbiKNNeN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Nov 2022 08:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236784AbiKNNeJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Nov 2022 08:34:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E2D1DF36
        for <linux-input@vger.kernel.org>; Mon, 14 Nov 2022 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668432795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yy3rT02cWYk8w73POFuuPbGjxwbMoSfpHRzGwRqsRO0=;
        b=it39jmSkbSuTbY/s13DEb5fwPQTzbxfodg4Hc2N0ZwDuHyMo/O2wxcS9Ex2k3nB8YqLLbO
        mv5j3GRmzTKElIeX0li9jeuRJjVIwTBoqCMs9maCXqssGTr7N+NMznwhIhPCNLV3xa+gcZ
        CIeiEt4n/ZI7ntV1ZhV+LqRUU+8JapE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-eDJ85qRXNHyUxosX_tPhrw-1; Mon, 14 Nov 2022 08:33:13 -0500
X-MC-Unique: eDJ85qRXNHyUxosX_tPhrw-1
Received: by mail-wm1-f71.google.com with SMTP id ay19-20020a05600c1e1300b003cf758f1617so8940406wmb.5
        for <linux-input@vger.kernel.org>; Mon, 14 Nov 2022 05:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yy3rT02cWYk8w73POFuuPbGjxwbMoSfpHRzGwRqsRO0=;
        b=rSXIuimb+5uICRIZWRVj9BhzL4jr+LGTAm3rwot9H4XvbWgXVFKmSn1AQZlp0xKlhG
         N9+hRgypP2R6eCMBkchMrB1NhmR6RdndDhAo2dq4eits6xcj2/WmHSy2imZHsP3PjWWR
         9D9VDL+hGeRqyD8GJe2+FCuUmnG2Kz5rBjX5JSezSglTDBl7M4Q29k0OuohbcTMPh5Tz
         lZrFC1bqqbmkjhOx4mBdtbg6sbs3Pa1yvXfi8t2JfbEmzMObTvIdXyWdKMsMTxlPaFcG
         Dt1KHuJ94l9QupKabFLp9MorRFK1iifKhcudkwCacQecZFe2v5lPmGPQj1AVtCLUAR+O
         zpEA==
X-Gm-Message-State: ANoB5pmBIEMLKaRjVUgwPac/4kZdSODFDKaiQjdx6ivp2ZIxa7MIxos+
        5RoXleXuL1pPlnP0b90lSk/1n0Ijp7FJqJVmhiND9IxqdYvyiy+anOrh8JyBNaJ/IMUxYJay4SH
        jY6/uoVGG/MSLy9MIMOZKFn4=
X-Received: by 2002:a5d:61d2:0:b0:236:6fd6:1af3 with SMTP id q18-20020a5d61d2000000b002366fd61af3mr7707007wrv.306.1668432792371;
        Mon, 14 Nov 2022 05:33:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6j2Ri2tOXP+cbfzdCXqFFxgcMv5TMdPXY0vvnrs/CTAsl8AxOwzEFEktSmatCAJD9YNmDoPw==
X-Received: by 2002:a5d:61d2:0:b0:236:6fd6:1af3 with SMTP id q18-20020a5d61d2000000b002366fd61af3mr7706988wrv.306.1668432791954;
        Mon, 14 Nov 2022 05:33:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:2bc:381::432? ([2a01:e0a:2bc:381::432])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b47e8a5d22sm20997562wmq.23.2022.11.14.05.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 05:33:11 -0800 (PST)
Message-ID: <9d0efafd-43b9-1c3b-4c3e-1add1b03bc3c@redhat.com>
Date:   Mon, 14 Nov 2022 14:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 11/13] HID: playstation: add DualShock4 bluetooth support.
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
 <20221029184851.282366-12-roderick.colenbrander@sony.com>
Content-Language: en-US
In-Reply-To: <20221029184851.282366-12-roderick.colenbrander@sony.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Sat, Oct 29, 2022 at 8:49 PM Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> Add support for DualShock4 in Bluetooth mode. In Bluetooth, the device
> is a bit strange in that after 'calibration' it switches sending all its
> input data from a basic report (only containing buttons/sticks) to an
> extended report, which also contains touchpad, motion sensors and other
> data. The overall design of this code is similar to the DualSense code.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---


Hi roderick,

Starting with this commit, the hid-tools testsuite is segfaulting:

---
hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_creation
PASSED [ 70%]
hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_buttons
PASSED [ 70%]
hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_dual_buttons
PASSED [ 70%]
hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_left_joystick_press_left
PASSED [ 70%]
hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_left_joystick_press_right
PASSED [ 70%][  534.255759] BUG: kernel NULL pointer dereference, address: 0000000000000010
[  534.256406] #PF: supervisor read access in kernel mode
[  534.256923] #PF: error_code(0x0000) - not-present page
[  534.257345] PGD 0 P4D 0
[  534.257558] Oops: 0000 [#1] PREEMPT SMP PTI
[  534.257897] CPU: 0 PID: 619 Comm: pytest-3 Not tainted 6.1.0-rc1-CI-PIPELINE-4044-g0f01ce929234 #1
[  534.258630] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-1.fc36 04/01/2014
[  534.259314] RIP: 0010:devres_release_group+0x69/0x160
[  534.259714] Code: 49 8b bc 24 98 02 00 00 49 8d b4 24 90 02 00 00 49 89 c7 48 39 fe 75 12 e9 de 00 00 00 48 8b 7f 08 48 39 fe 0f 84 d1 00 00 00 <48> 81 7f 10 f0 da fb 83 75 e9 48 85 db 0f 84 a0 00 00 00 48 3b 5f
[  534.261197] RSP: 0018:ffffa145c0887ca8 EFLAGS: 00010082
[  534.261618] RAX: 0000000000000246 RBX: ffffffff84153600 RCX: 0000000000000000
[  534.262179] RDX: 0000000000000001 RSI: ffff970980ba56c8 RDI: 0000000000000000
[  534.262731] RBP: ffff970980ba56c4 R08: 0000000000000001 R09: ffffffff83ad9800
[  534.263290] R10: 000000000000001f R11: ffff97098a9186d8 R12: ffff970980ba5438
[  534.263835] R13: ffffa145c0887ca8 R14: 0000000000000014 R15: 0000000000000246
[  534.264654] FS:  00007f3aae1db740(0000) GS:ffff9709bbc00000(0000) knlGS:0000000000000000
[  534.265584] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  534.266265] CR2: 0000000000000010 CR3: 0000000100b4c001 CR4: 0000000000170ef0
[  534.267022] Call Trace:
[  534.267215]  <TASK>
[  534.267391]  power_supply_unregister+0x55/0xc0
[  534.267770]  devres_release_all+0xb3/0x100
[  534.268100]  device_unbind_cleanup+0x9/0x70
[  534.268430]  device_release_driver_internal+0x1da/0x230
[  534.268866]  bus_remove_device+0xcd/0x110
[  534.269317]  device_del+0x18c/0x4b0
[  534.269719]  ? __cancel_work_timer+0xf5/0x190
[  534.270167]  hid_destroy_device+0x3d/0x50
[  534.270548]  uhid_char_write+0x490/0x540
[  534.270978]  vfs_write+0xc2/0x400
[  534.271349]  ? kvm_clock_get_cycles+0x14/0x30
[  534.271802]  ? ktime_get+0x36/0x90
[  534.272072]  ? lapic_timer_set_periodic+0x20/0x20
[  534.272492]  ? clockevents_program_event+0x90/0xf0
[  534.272942]  ksys_write+0xb2/0xe0
[  534.273221]  do_syscall_64+0x3a/0x90
[  534.273578]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  534.274073] RIP: 0033:0x7f3aae3bd8f7
[  534.274404] Code: 0f 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  534.276478] RSP: 002b:00007ffcbc210348 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  534.277366] RAX: ffffffffffffffda RBX: 00007f3aae1db6c0 RCX: 00007f3aae3bd8f7
[  534.278210] RDX: 0000000000000004 RSI: 00007f3aa49b2de0 RDI: 000000000000000b
[  534.279086] RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
[  534.279969] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f3aa49b2de0
[  534.280816] R13: 000000000000000b R14: 0000555a22edb620 R15: 00007f3aac4dc548
[  534.281533]  </TASK>
[  534.281760] Modules linked in:
[  534.282084] CR2: 0000000000000010
[  534.282404] ---[ end trace 0000000000000000 ]---
[  534.282838] RIP: 0010:devres_release_group+0x69/0x160
[  534.283301] Code: 49 8b bc 24 98 02 00 00 49 8d b4 24 90 02 00 00 49 89 c7 48 39 fe 75 12 e9 de 00 00 00 48 8b 7f 08 48 39 fe 0f 84 d1 00 00 00 <48> 81 7f 10 f0 da fb 83 75 e9 48 85 db 0f 84 a0 00 00 00 48 3b 5f
[  534.285303] RSP: 0018:ffffa145c0887ca8 EFLAGS: 00010082
[  534.285722] RAX: 0000000000000246 RBX: ffffffff84153600 RCX: 0000000000000000
[  534.286292] RDX: 0000000000000001 RSI: ffff970980ba56c8 RDI: 0000000000000000
[  534.286885] RBP: ffff970980ba56c4 R08: 0000000000000001 R09: ffffffff83ad9800
[  534.287629] R10: 000000000000001f R11: ffff97098a9186d8 R12: ffff970980ba5438
[  534.288415] R13: ffffa145c0887ca8 R14: 0000000000000014 R15: 0000000000000246
[  534.289247] FS:  00007f3aae1db740(0000) GS:ffff9709bbc00000(0000) knlGS:0000000000000000
[  534.290184] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  534.290848] CR2: 0000000000000010 CR3: 0000000100b4c001 CR4: 0000000000170ef0
[  534.291588] note: pytest-3[619] exited with preempt_count 1
---

Would you mind having a look at it?

Cheers,
Benjamin

  >
>  drivers/hid/hid-playstation.c | 170 ++++++++++++++++++++++++++++------
>  1 file changed, 144 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 81a12aafed17..a2f1bd1400a2 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -287,11 +287,17 @@ struct dualsense_output_report {
>
>  #define DS4_INPUT_REPORT_USB                   0x01
>  #define DS4_INPUT_REPORT_USB_SIZE              64
> +#define DS4_INPUT_REPORT_BT                    0x11
> +#define DS4_INPUT_REPORT_BT_SIZE               78
>  #define DS4_OUTPUT_REPORT_USB                  0x05
>  #define DS4_OUTPUT_REPORT_USB_SIZE             32
> +#define DS4_OUTPUT_REPORT_BT                   0x11
> +#define DS4_OUTPUT_REPORT_BT_SIZE              78
>
>  #define DS4_FEATURE_REPORT_CALIBRATION         0x02
>  #define DS4_FEATURE_REPORT_CALIBRATION_SIZE    37
> +#define DS4_FEATURE_REPORT_CALIBRATION_BT      0x05
> +#define DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE 41
>  #define DS4_FEATURE_REPORT_FIRMWARE_INFO       0xa3
>  #define DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE  49
>  #define DS4_FEATURE_REPORT_PAIRING_INFO                0x12
> @@ -310,6 +316,9 @@ struct dualsense_output_report {
>  /* Battery status within batery_status field. */
>  #define DS4_BATTERY_STATUS_FULL                11
>
> +#define DS4_OUTPUT_HWCTL_CRC32         0x40
> +#define DS4_OUTPUT_HWCTL_HID           0x80
> +
>  /* Flags for DualShock4 output report. */
>  #define DS4_OUTPUT_VALID_FLAG0_MOTOR           0x01
>  #define DS4_OUTPUT_VALID_FLAG0_LED             0x02
> @@ -401,6 +410,17 @@ struct dualshock4_input_report_usb {
>  } __packed;
>  static_assert(sizeof(struct dualshock4_input_report_usb) == DS4_INPUT_REPORT_USB_SIZE);
>
> +struct dualshock4_input_report_bt {
> +       uint8_t report_id; /* 0x11 */
> +       uint8_t reserved[2];
> +       struct dualshock4_input_report_common common;
> +       uint8_t num_touch_reports;
> +       struct dualshock4_touch_report touch_reports[4]; /* BT has 4 compared to 3 for USB */
> +       uint8_t reserved2[2];
> +       __le32 crc32;
> +} __packed;
> +static_assert(sizeof(struct dualshock4_input_report_bt) == DS4_INPUT_REPORT_BT_SIZE);
> +
>  /* Common data between Bluetooth and USB DualShock4 output reports. */
>  struct dualshock4_output_report_common {
>         uint8_t valid_flag0;
> @@ -425,6 +445,16 @@ struct dualshock4_output_report_usb {
>  } __packed;
>  static_assert(sizeof(struct dualshock4_output_report_usb) == DS4_OUTPUT_REPORT_USB_SIZE);
>
> +struct dualshock4_output_report_bt {
> +       uint8_t report_id; /* 0x11 */
> +       uint8_t hw_control;
> +       uint8_t audio_control;
> +       struct dualshock4_output_report_common common;
> +       uint8_t reserved[61];
> +       __le32 crc32;
> +} __packed;
> +static_assert(sizeof(struct dualshock4_output_report_bt) == DS4_OUTPUT_REPORT_BT_SIZE);
> +
>  /*
>   * The DualShock4 has a main output report used to control most features. It is
>   * largely the same between Bluetooth and USB except for different headers and CRC.
> @@ -434,6 +464,8 @@ struct dualshock4_output_report {
>         uint8_t *data; /* Start of data */
>         uint8_t len; /* Size of output report */
>
> +       /* Points to Bluetooth data payload in case for a Bluetooth report else NULL. */
> +       struct dualshock4_output_report_bt *bt;
>         /* Points to USB data payload in case for a USB report else NULL. */
>         struct dualshock4_output_report_usb *usb;
>         /* Points to common section of report, so past any headers. */
> @@ -1646,26 +1678,49 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
>         int ret = 0;
>         uint8_t *buf;
>
> -       buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
> -       if (!buf)
> -               return -ENOMEM;
> +       if (ds4->base.hdev->bus == BUS_USB) {
> +               buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
> +               if (!buf)
> +                       return -ENOMEM;
>
> -       ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
> -                       DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
> -       if (ret) {
> -               hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
> -               goto err_free;
> +               ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
> +                               DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
> +               if (ret) {
> +                       hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
> +                       goto err_free;
> +               }
> +       } else { /* Bluetooth */
> +               buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, GFP_KERNEL);
> +               if (!buf)
> +                       return -ENOMEM;
> +
> +               ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION_BT, buf,
> +                               DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, true);
> +               if (ret) {
> +                       hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
> +                       goto err_free;
> +               }
>         }
>
>         gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
>         gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
>         gyro_roll_bias   = get_unaligned_le16(&buf[5]);
> -       gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
> -       gyro_pitch_minus = get_unaligned_le16(&buf[9]);
> -       gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
> -       gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
> -       gyro_roll_plus   = get_unaligned_le16(&buf[15]);
> -       gyro_roll_minus  = get_unaligned_le16(&buf[17]);
> +       if (ds4->base.hdev->bus == BUS_USB) {
> +               gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
> +               gyro_pitch_minus = get_unaligned_le16(&buf[9]);
> +               gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
> +               gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
> +               gyro_roll_plus   = get_unaligned_le16(&buf[15]);
> +               gyro_roll_minus  = get_unaligned_le16(&buf[17]);
> +       } else {
> +               /* BT + Dongle */
> +               gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
> +               gyro_yaw_plus    = get_unaligned_le16(&buf[9]);
> +               gyro_roll_plus   = get_unaligned_le16(&buf[11]);
> +               gyro_pitch_minus = get_unaligned_le16(&buf[13]);
> +               gyro_yaw_minus   = get_unaligned_le16(&buf[15]);
> +               gyro_roll_minus  = get_unaligned_le16(&buf[17]);
> +       }
>         gyro_speed_plus  = get_unaligned_le16(&buf[19]);
>         gyro_speed_minus = get_unaligned_le16(&buf[21]);
>         acc_x_plus       = get_unaligned_le16(&buf[23]);
> @@ -1731,8 +1786,11 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
>         if (!buf)
>                 return -ENOMEM;
>
> +       /* Note USB and BT support the same feature report, but this report
> +        * lacks CRC support, so must be disabled in ps_get_report.
> +        */
>         ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_FIRMWARE_INFO, buf,
> -                       DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, true);
> +                       DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, false);
>         if (ret) {
>                 hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 firmware info: %d\n", ret);
>                 goto err_free;
> @@ -1748,21 +1806,38 @@ static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
>
>  static int dualshock4_get_mac_address(struct dualshock4 *ds4)
>  {
> +       struct hid_device *hdev = ds4->base.hdev;
>         uint8_t *buf;
>         int ret = 0;
>
> -       buf = kzalloc(DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
> -       if (!buf)
> -               return -ENOMEM;
> +       if (hdev->bus == BUS_USB) {
> +               buf = kzalloc(DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
> +               if (!buf)
> +                       return -ENOMEM;
> +
> +               ret = ps_get_report(hdev, DS4_FEATURE_REPORT_PAIRING_INFO, buf,
> +                               DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, false);
> +               if (ret) {
> +                       hid_err(hdev, "Failed to retrieve DualShock4 pairing info: %d\n", ret);
> +                       goto err_free;
> +               }
>
> -       ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_PAIRING_INFO, buf,
> -                       DS4_FEATURE_REPORT_PAIRING_INFO_SIZE, true);
> -       if (ret) {
> -               hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 pairing info: %d\n", ret);
> -               goto err_free;
> -       }
> +               memcpy(ds4->base.mac_address, &buf[1], sizeof(ds4->base.mac_address));
> +       } else {
> +               /* Rely on HIDP for Bluetooth */
> +               if (strlen(hdev->uniq) != 17)
> +                       return -EINVAL;
> +
> +               ret = sscanf(hdev->uniq, "%02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx",
> +                               &ds4->base.mac_address[5], &ds4->base.mac_address[4],
> +                               &ds4->base.mac_address[3], &ds4->base.mac_address[2],
> +                               &ds4->base.mac_address[1], &ds4->base.mac_address[0]);
>
> -       memcpy(ds4->base.mac_address, &buf[1], sizeof(ds4->base.mac_address));
> +               if (ret != sizeof(ds4->base.mac_address))
> +                       return -EINVAL;
> +
> +               ret = 0;
> +       }
>
>  err_free:
>         kfree(buf);
> @@ -1859,7 +1934,18 @@ static void dualshock4_init_output_report(struct dualshock4 *ds4,
>  {
>         struct hid_device *hdev = ds4->base.hdev;
>
> -       if (hdev->bus == BUS_USB) {
> +       if (hdev->bus == BUS_BLUETOOTH) {
> +               struct dualshock4_output_report_bt *bt = buf;
> +
> +               memset(bt, 0, sizeof(*bt));
> +               bt->report_id = DS4_OUTPUT_REPORT_BT;
> +
> +               rp->data = buf;
> +               rp->len = sizeof(*bt);
> +               rp->bt = bt;
> +               rp->usb = NULL;
> +               rp->common = &bt->common;
> +       } else { /* USB */
>                 struct dualshock4_output_report_usb *usb = buf;
>
>                 memset(usb, 0, sizeof(*usb));
> @@ -1867,6 +1953,7 @@ static void dualshock4_init_output_report(struct dualshock4 *ds4,
>
>                 rp->data = buf;
>                 rp->len = sizeof(*usb);
> +               rp->bt = NULL;
>                 rp->usb = usb;
>                 rp->common = &usb->common;
>         }
> @@ -1913,6 +2000,22 @@ static void dualshock4_output_worker(struct work_struct *work)
>
>         spin_unlock_irqrestore(&ds4->base.lock, flags);
>
> +       /* Bluetooth packets need additional flags as well as a CRC in the last 4 bytes. */
> +       if (report.bt) {
> +               uint32_t crc;
> +               uint8_t seed = PS_OUTPUT_CRC32_SEED;
> +
> +               /* Hardware control flags need to set to let the device know
> +                * there is HID data as well as CRC.
> +                */
> +               report.bt->hw_control = DS4_OUTPUT_HWCTL_HID | DS4_OUTPUT_HWCTL_CRC32;
> +
> +               crc = crc32_le(0xFFFFFFFF, &seed, 1);
> +               crc = ~crc32_le(crc, report.data, report.len - 4);
> +
> +               report.bt->crc32 = cpu_to_le32(crc);
> +       }
> +
>         hid_hw_output_report(ds4->base.hdev, report.data, report.len);
>  }
>
> @@ -1940,6 +2043,19 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
>                 ds4_report = &usb->common;
>                 num_touch_reports = usb->num_touch_reports;
>                 touch_reports = usb->touch_reports;
> +       } else if (hdev->bus == BUS_BLUETOOTH && report->id == DS4_INPUT_REPORT_BT &&
> +                       size == DS4_INPUT_REPORT_BT_SIZE) {
> +               struct dualshock4_input_report_bt *bt = (struct dualshock4_input_report_bt *)data;
> +
> +               /* Last 4 bytes of input report contains CRC. */
> +               if (!ps_check_crc32(PS_INPUT_CRC32_SEED, data, size - 4, bt->crc32)) {
> +                       hid_err(hdev, "DualShock4 input CRC's check failed\n");
> +                       return -EILSEQ;
> +               }
> +
> +               ds4_report = &bt->common;
> +               num_touch_reports = bt->num_touch_reports;
> +               touch_reports = bt->touch_reports;
>         } else {
>                 hid_err(hdev, "Unhandled reportID=%d\n", report->id);
>                 return -1;
> @@ -2354,7 +2470,9 @@ static void ps_remove(struct hid_device *hdev)
>
>  static const struct hid_device_id ps_devices[] = {
>         /* Sony DualShock 4 controllers for PS4 */
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER) },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2) },
>         /* Sony DualSense controllers for PS5 */
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
> --
> 2.37.3
>

