Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37BBA108500
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2019 22:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfKXVF3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Nov 2019 16:05:29 -0500
Received: from mail-40130.protonmail.ch ([185.70.40.130]:58476 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfKXVF3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Nov 2019 16:05:29 -0500
Date:   Sun, 24 Nov 2019 21:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1574629524;
        bh=ZAxv2jVK0Z3Qt1z6lNZQ74w2PqsNzQE8blamFUnouYI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=s45Tglkxan9Qh0Dd8J2Z0vYX5Y+oUm3btR7RNAf+2mPcFvutr3mns2TMVKVVCvQLl
         gdyKhiWgPzXD3Zpdkd/k0rOJffwHE0cC7LMuMv423YGpmF8H//4eCpqITnlTjH7+Zb
         NiFymq5i3uXERvBBkDOxcUkGkhPZ8eGYuPLIYSa8=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        "mnrzk@protonmail.com" <mnrzk@protonmail.com>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH v8 0/2] Logitech HID++ Bluetooth LE support
Message-ID: <haSzI6CpbhKWB-YGuSryCNj3sW6YXUkBlN1LZyy6pyoYPUD-Z7DwCkoRnVY-1iHX3FlxpsydH2YF_effQsePpDZnTp7937mNgvLVPjneUYY=@protonmail.com>
In-Reply-To: <_0snBXtGhwWiRLYmuVIeDLYkvksMVMxiBv1lW_bTTaFpcVN45l6yCU5gWZ_5oJr8SQOZA6qCZSkVskkEX0ZePpboYtDYRsTdVg3xfcwmw6M=@protonmail.com>
References: <_0snBXtGhwWiRLYmuVIeDLYkvksMVMxiBv1lW_bTTaFpcVN45l6yCU5gWZ_5oJr8SQOZA6qCZSkVskkEX0ZePpboYtDYRsTdVg3xfcwmw6M=@protonmail.com>
Feedback-ID: 18B_FC5q-t32TXzMsVp9BgkgrdNH3iwklfW8WOrHrcxZA0WRj7JodCh5VXKxs6A3OaiHK0QNd8wi3SImKex8yQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sunday, October 27, 2019 1:44 PM, Mazin Rezk <mnrzk@protonmail.com> wrot=
e:

> This series allows hid-logitech-hidpp to support Bluetooth LE HID++
> devices. Only the MX Master (b012 and b01e) is added right now but more
> HID++ Bluetooth LE devices can be added once they are tested.
>
> Changes since [v7]:
> - Squashed "HID: logitech-hidpp: Support MX Master (b012, b01e)
> over Bluetooth" into "HID: logitech-hidpp: Support translations
> from short to long reports"
>
> Changes since [v6]:
>
> - Based patch on "HID: logitech-hidpp: rework device validation"
>
> - Removed the need for additional quirks
>
> Changes since [v5]:
>
> - Fixed bug where added quirks would overflow an unsigned long
>
> - Changed the reserved quirk class bits from 0..20 to 0..15
>
> Changes since [v4]:
>
> - Omitted "HID: logitech: Add feature 0x0001: FeatureSet"
>
> - Stored WirelessDeviceStatus feature index in hidpp_device
>
> - Made Bluetooth quirk class alias quirks instead of vice versa
>
> - Omitted non-tested devices
>
> Changes since [v3]:
>
> - Renamed hidpp20_featureset_get_feature to
> hidpp20_featureset_get_feature_id.
>
> - Re-ordered hidpp20_featureset_get_count and
> hidpp20_featureset_get_feature_id based on their command IDs.
>
> - Made feature_count initialize to 0 before running
> hidpp20_get_features.
>
> Changes since [v2]:
>
> - Split up the single patch into a series
>
> Changes since [v1]:
>
> - Added WirelessDeviceStatus support
>
> [v7] https://lore.kernel.org/lkml/t5LOL-A4W7aknqQdC-3TavitC94BY_Ra1qyxCZM=
h_nprrDNSl4UF-jYpWtaDSU-0oQ5xzRyAo9o_mvSnA78bib_p6I3ePSJnTrp3Eb0X_yg=3D@pro=
tonmail.com
> [v6] https://lore.kernel.org/lkml/ggKipcQplIlTFmoP3hPnrQ-7_5-C0PKGd5feFym=
ts3uenIBA8zOwz47YmKheD34H1rpkguDAGdx5YbS9UqpwfjT5Ir0Lji941liLVp--QtQ=3D@pro=
tonmail.com
> [v5] https://lore.kernel.org/lkml/Mbf4goGxXZTfWwWtQQUke_rNf8kezpNOS9DVEVH=
f6RnnmjS1oRtMOJf4r14WfCC6GRYVs7gi0uZcIJ18Va2OJowzSbyMUGwLrl6I5fjW48o=3D@pro=
tonmail.com
> [v4] https://lore.kernel.org/lkml/uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPr=
xNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=3D@pro=
tonmail.com
> [v3] https://lore.kernel.org/lkml/l7xYjnA9EGfZe03FsrFhnH2aMq8qS8plWhHVvOt=
Y_l4ShZ1NV6HA6hn9aI-jAzbLYUGFCIQCIKkx9z42Uoj4-AZDwBfRcAecYIn-0ZA5upE=3D@pro=
tonmail.com
> [v2] https://www.spinics.net/lists/linux-input/msg63467.html
> [v1] https://www.spinics.net/lists/linux-input/msg63317.html
>
> Mazin Rezk (2):
> HID: logitech-hidpp: Support translations from short to long reports
> HID: logitech-hidpp: Support WirelessDeviceStatus connect events
>
> drivers/hid/hid-logitech-hidpp.c | 69 +++++++++++++++++++++++++++-----
> 1 file changed, 59 insertions(+), 10 deletions(-)
>
> ---
> 2.23.0

I recently saw "HID: logitech-hidpp: Silence intermittent
get_battery_capacity errors" get applied into the kernel, would I need to
rebase this patch on top of https://patchwork.kernel.org/patch/11243871/

Thanks,
Mazin

