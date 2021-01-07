Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C8E2EE6A5
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 21:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbhAGUTn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 15:19:43 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:43353 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbhAGUTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 15:19:43 -0500
Date:   Thu, 07 Jan 2021 20:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610050740;
        bh=D0SF0o13xOc1LCpdPPlbtgZWDvhYaEC0Q7NcoTvsBXc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=a4genU7hISCyM+G4sawhKMPZhYiH4X9Qu34RcY8DY1ezk6XRpY2W3XKvP8onmVBeq
         Yq8M9vQe6xwdzO5zR+3s6WlrS8OSvSIGNrKhL+3si1/XEHGeorYLTaKBT2a1ICUHXD
         FCXuvaycZfJWADWFsR46c8WGqmEAWu75Vl9E7ABU=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 07/13] HID: playstation: add DualSense Bluetooth support.
Message-ID: <gzUzvibAvaIyvKhvSZUEHSfjBnwtAdxVGnOGuAOyFkoI5mWp1VqqVeNhSD5M0M2NYxhUU5zjy4DitGclUhZkudSfmsSr7JaNv_cN8HZ3JK8=@protonmail.com>
In-Reply-To: <20210102223109.996781-8-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-8-roderick@gaikai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrander=
 =C3=ADrta:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> This patch adds support for the DualSense when operating in Bluetooth mod=
e.
> The device has the same behavior as the DualShock 4 in that by default it
> sends a limited input report (0x1), but after requesting calibration data=
,
> it switches to an extended input report (report 49), which adds data for
> touchpad, motion sensors, battery and more.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> [...]
>  static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
>  {
>  =09struct input_dev *gamepad;
> @@ -406,6 +418,18 @@  static int dualsense_get_calibration_data(struct du=
alsense *ds)
>  =09=09goto err_free;
>  =09}
>
> +=09if (ds->base.hdev->bus =3D=3D BUS_BLUETOOTH) {
> +=09=09/* Last 4 bytes contains crc32 */

Most other comments have a period at the end. I know this is a minor thing,
but I believe being consistent is better than not.

And shouldn't this CRC be checked in `dualsense_get_mac_address()`?
If so, maybe a helper function could be created that wraps the `hid_hw_raw_=
request()`
call?


> +=09=09uint8_t crc_offset =3D DS_FEATURE_REPORT_CALIBRATION_SIZE - 4;
> +=09=09uint32_t report_crc =3D get_unaligned_le32(&buf[crc_offset]);
> +
> +=09=09if (!ps_check_crc32(0xa3, buf, crc_offset, report_crc)) {

Maybe that 0xa3 could be named?


> +=09=09=09hid_err(ds->base.hdev, "DualSense calibration report CRC's chec=
k failed\n");
> +=09=09=09ret =3D -EILSEQ;
> +=09=09=09goto err_free;
> +=09=09}
> +=09}
> +
>  =09gyro_pitch_bias  =3D get_unaligned_le16(&buf[1]);
>  =09gyro_yaw_bias    =3D get_unaligned_le16(&buf[3]);
>  =09gyro_roll_bias   =3D get_unaligned_le16(&buf[5]);
> @@ -515,6 +539,16 @@  static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
>  =09 */
>  =09if (report->id =3D=3D DS_INPUT_REPORT_USB && hdev->bus =3D=3D BUS_USB=
) {
>  =09=09ds_report =3D (struct dualsense_input_report *)&data[1];
> +=09} else if (report->id =3D=3D DS_INPUT_REPORT_BT && hdev->bus =3D=3D B=
US_BLUETOOTH) {
> +=09=09/* Last 4 bytes of input report contain crc32 */
> +=09=09uint32_t report_crc =3D get_unaligned_le32(&data[size - 4]);
> +
> +=09=09if (!ps_check_crc32(0xa1, data, size - 4, report_crc)) {

And this 0xa1 as well?


> +=09=09=09hid_err(hdev, "DualSense input CRC's check failed, size=3D%d\n"=
, size);
> +=09=09=09return -EILSEQ;
> +=09=09}
> +
> +=09=09ds_report =3D (struct dualsense_input_report *)&data[2];
>  =09} else {
>  =09=09hid_err(hdev, "Unhandled reportID=3D%d\n", report->id);
>  =09=09return -1;
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze

