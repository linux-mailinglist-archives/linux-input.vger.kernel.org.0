Return-Path: <linux-input+bounces-11799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3489CA8A5AB
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 19:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38DD1170C8B
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 17:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0F222128A;
	Tue, 15 Apr 2025 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL7nqzkC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4895B21D5B1;
	Tue, 15 Apr 2025 17:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744738328; cv=none; b=jATKQlj1l56y9NtcpE1S0ryJRbREDTL3Kk+69o/oGxVSq34YgjVrjt+BMQ/zlIbppgNoMRpKjhJsdUxuEDMRE1IOGqAvczIOLJJX5L6y8mpwT2S0OHLW+DVTFKBDZW52oSCgBBwSIkklhwuVlIV7JTx9yy6Z05txPgroRTkqH+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744738328; c=relaxed/simple;
	bh=TcdDi4JssqzFrA5WEswEqn/d4UAMFN9FdFx1E6HlpvA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ePox1LC8/EYVTFflso/PB2ijVUgmllEWuTr6oYiXCKrQL2m8zw1u7aPfVPn0ENjMfAk0Tx/CJsrW37IJci3pwN+TCZGJBBNfdtvfRXHP67DoeeKWKOOvzYKsBQAuKNtK5Y8NeHHj14ZG2Q3tqXrzygOYy5SGN5riUj3YVUwRXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL7nqzkC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744738326; x=1776274326;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TcdDi4JssqzFrA5WEswEqn/d4UAMFN9FdFx1E6HlpvA=;
  b=TL7nqzkCv96hYhiBSByQQxSktMwGC7nHef8A9bWeNeICO4vZze3pNmDz
   5hhpdx6/3qHQYB4xpOf5HPtZRKI0w4VbClC+A4w5gQHtRfsIuHNN3r8f0
   XYxmGD+1q6sixCGrbfxIzxRGc9rktWZvn60WcVOpW0+f8cOz1tjCBjL17
   a4OrSX9k+2NtNuZwqUWCYdzf//FfyOnGTkwL+kcjC8aSt5BRTxK43TE2E
   U/LNl4qptIvCElYsoTXpLvaneThgQvfKvdAHYIqiu8guXEMY61pOvSl8W
   I2G3R5xWG2RTwraLhfvAgretyEfmO3D+Fhf6sgzFcWQr8c7OzQnXKRts1
   w==;
X-CSE-ConnectionGUID: P+aNTClOTdm4W1pJD0UrUQ==
X-CSE-MsgGUID: Ab+3jL3OTnu8ucVDjMtJsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46349449"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46349449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 10:32:05 -0700
X-CSE-ConnectionGUID: Izul22wzTrq7I7hZKELFXQ==
X-CSE-MsgGUID: hirzGeTgTRGqagxLTbaF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161221604"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 10:32:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 20:32:01 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
    linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
In-Reply-To: <52b7051e-cc41-4983-aee9-a9a9fc4a404d@tuxedocomputers.com>
Message-ID: <7d083fb7-74e9-37b6-0fa4-4f97d55ef619@linux.intel.com>
References: <20250403212934.561943-1-wse@tuxedocomputers.com> <20250403212934.561943-2-wse@tuxedocomputers.com> <9251783a-de2e-b923-2e05-ee30761846bc@linux.intel.com> <52b7051e-cc41-4983-aee9-a9a9fc4a404d@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-443296695-1744738321=:942"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-443296695-1744738321=:942
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Apr 2025, Werner Sembach wrote:
> Am 11.04.25 um 15:48 schrieb Ilpo J=C3=A4rvinen:
> > On Thu, 3 Apr 2025, Werner Sembach wrote:
> >=20
> > > The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a pe=
r-key
> > > controllable RGB keyboard backlight. The firmware API for it is
> > > implemented
> > > via WMI.
> > >=20
> > > To make the backlight userspace configurable this driver emulates a
> > > LampArray HID device and translates the input from hidraw to the
> > > corresponding WMI calls. This is a new approach as the leds subsystem
> > > lacks
> > > a suitable UAPI for per-key keyboard backlights, and like this no new=
 UAPI
> > > needs to be established.
> > >=20
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > ---
> > >   MAINTAINERS                                 |   6 +
> > >   drivers/platform/x86/Kconfig                |   2 +
> > >   drivers/platform/x86/Makefile               |   3 +
> > >   drivers/platform/x86/tuxedo/Kconfig         |   8 +
> > >   drivers/platform/x86/tuxedo/Makefile        |   8 +
> > >   drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
> > >   drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
> > >   drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 847 +++++++++++++++++=
+++
> > >   drivers/platform/x86/tuxedo/nb04/wmi_util.c |  95 +++
> > >   drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
> > >   10 files changed, 1103 insertions(+)
> > >   create mode 100644 drivers/platform/x86/tuxedo/Kconfig
> > >   create mode 100644 drivers/platform/x86/tuxedo/Makefile
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 00e94bec401e1..c1f7460c246ad 100644


> > > +struct tux_driver_data_t {
> > > +=09struct hid_device *hdev;
> > > +};
> > > +
> > > +struct tux_hdev_driver_data_t {
> > > +=09u8 keyboard_type;
> > > +=09u8 lamp_count;
> > > +=09u8 next_lamp_id;
> > > +=09union tux_wmi_xx_496in_80out_in_t next_kbl_set_multiple_keys_in;
> > > +};
> > > +
> > > +static int tux_ll_start(struct hid_device *hdev)
> > > +{
> > > +=09struct wmi_device *wdev =3D to_wmi_device(hdev->dev.parent);
> > > +=09struct tux_hdev_driver_data_t *driver_data;
> > > +=09union tux_wmi_xx_8in_80out_out_t out;
> > > +=09union tux_wmi_xx_8in_80out_in_t in;
> > > +=09int ret;
> > > +
> > > +=09driver_data =3D devm_kzalloc(&hdev->dev, sizeof(*driver_data),
> > > GFP_KERNEL);
> > > +=09if (!driver_data)
> > > +=09=09return -ENOMEM;
> > > +
> > > +=09in.get_device_status_in.device_type =3D
> > > WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD;
> > > +=09ret =3D tux_wmi_xx_8in_80out(wdev, WMI_AB_GET_DEVICE_STATUS, &in,=
 &out);
> > > +=09if (ret)
> > > +=09=09return ret;
> > > +
> > > +=09driver_data->keyboard_type =3D
> > > out.get_device_status_out.keyboard_physical_layout;
> > > +=09if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
> > > +=09=09driver_data->lamp_count =3D sizeof(sirius_16_ansii_kbl_mapping=
);
> > > +=09else if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
> > > +=09=09driver_data->lamp_count =3D sizeof(sirius_16_iso_kbl_mapping);
> > > +=09else
> > > +=09=09return -EINVAL;
> > > +=09driver_data->next_lamp_id =3D 0;
> > > +
> > > +=09dev_set_drvdata(&hdev->dev, driver_data);
> > > +
> > > +=09return ret;
> > > +}
> > > +
> > > +static void tux_ll_stop(struct hid_device __always_unused *hdev)
> > > +{
> > > +}
> > > +
> > > +static int tux_ll_open(struct hid_device __always_unused *hdev)
> > > +{
> > > +=09return 0;
> > > +}
> > > +
> > > +static void tux_ll_close(struct hid_device __always_unused *hdev)
> > > +{
> > > +}
> > > +
> > > +static int tux_ll_parse(struct hid_device *hdev)
> > > +{
> > > +=09return hid_parse_report(hdev, tux_report_descriptor,
> > > +=09=09=09=09sizeof(tux_report_descriptor));
> > > +}
> > > +
> > > +struct __packed lamp_array_attributes_report_t {
> > > +=09const u8 report_id;
> > > +=09u16 lamp_count;
> > > +=09u32 bounding_box_width_in_micrometers;
> > > +=09u32 bounding_box_height_in_micrometers;
> > > +=09u32 bounding_box_depth_in_micrometers;
> > > +=09u32 lamp_array_kind;
> > > +=09u32 min_update_interval_in_microseconds;
> > > +};
> > > +
> > > +static int handle_lamp_array_attributes_report(struct hid_device *hd=
ev,
> > > +=09=09=09=09=09       struct
> > > lamp_array_attributes_report_t *rep)
> > > +{
> > > +=09struct tux_hdev_driver_data_t *driver_data =3D
> > > dev_get_drvdata(&hdev->dev);
> > > +
> > > +=09rep->lamp_count =3D driver_data->lamp_count;
> > > +=09rep->bounding_box_width_in_micrometers =3D 368000;
> > > +=09rep->bounding_box_height_in_micrometers =3D 266000;
> > > +=09rep->bounding_box_depth_in_micrometers =3D 30000;
> > > +=09/*
> > > +=09 * LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
> > > +=09 * "HID Usage Tables v1.5"
> > > +=09 */
> > > +=09rep->lamp_array_kind =3D 1;
> > > +=09// Some guessed value for interval microseconds
> > > +=09rep->min_update_interval_in_microseconds =3D 500;
> > > +
> > > +=09return sizeof(*rep);
> > > +}
> > > +
> > > +struct __packed lamp_attributes_request_report_t {
> > > +=09const u8 report_id;
> > > +=09u16 lamp_id;
> > > +};
> > > +
> > > +static int handle_lamp_attributes_request_report(struct hid_device *=
hdev,
> > > +=09=09=09=09=09=09 struct
> > > lamp_attributes_request_report_t *rep)
> > > +{
> > > +=09struct tux_hdev_driver_data_t *driver_data =3D
> > > dev_get_drvdata(&hdev->dev);
> > > +
> > > +=09if (rep->lamp_id < driver_data->lamp_count)
> > > +=09=09driver_data->next_lamp_id =3D rep->lamp_id;
> > > +=09else
> > > +=09=09driver_data->next_lamp_id =3D 0;
> > > +
> > > +=09return sizeof(*rep);
> > > +}
> > > +
> > > +struct __packed lamp_attributes_response_report_t {
> > > +=09const u8 report_id;
> > > +=09u16 lamp_id;
> > > +=09u32 position_x_in_micrometers;
> > > +=09u32 position_y_in_micrometers;
> > > +=09u32 position_z_in_micrometers;
> > > +=09u32 update_latency_in_microseconds;
> > > +=09u32 lamp_purpose;
> > > +=09u8 red_level_count;
> > > +=09u8 green_level_count;
> > > +=09u8 blue_level_count;
> > > +=09u8 intensity_level_count;
> > > +=09u8 is_programmable;
> > > +=09u8 input_binding;
> > > +};
> > > +
> > > +static int handle_lamp_attributes_response_report(struct hid_device
> > > *hdev,
> > > +=09=09=09=09=09=09  struct
> > > lamp_attributes_response_report_t *rep)
> > > +{
> > > +=09struct tux_hdev_driver_data_t *driver_data =3D
> > > dev_get_drvdata(&hdev->dev);
> > > +=09u16 lamp_id =3D driver_data->next_lamp_id;
> > > +
> > Don't leave empty lines into the variable declaration block.
> ack, an oversight
> >=20
> > > +=09const u32 *kbl_mapping_pos_x, *kbl_mapping_pos_y, *kbl_mapping_po=
s_z;
> > > +=09const u8 *kbl_mapping;
> > > +
> > > +=09rep->lamp_id =3D lamp_id;
> > > +=09// Some guessed value for latency microseconds
> > > +=09rep->update_latency_in_microseconds =3D 100;
> > > +=09/*
> > > +=09 * LampPurposeControl, see "26.3.1 LampPurposes Flags" of
> > > +=09 * "HID Usage Tables v1.5"
> > > +=09 */
> > > +=09rep->lamp_purpose =3D 1;
> > > +=09rep->red_level_count =3D 0xff;
> > > +=09rep->green_level_count =3D 0xff;
> > > +=09rep->blue_level_count =3D 0xff;
> > > +=09rep->intensity_level_count =3D 0xff;
> > > +=09rep->is_programmable =3D 1;
> > > +
> > > +=09if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII) {
> > > +=09=09kbl_mapping =3D &sirius_16_ansii_kbl_mapping[0];
> > > +=09=09kbl_mapping_pos_x =3D &sirius_16_ansii_kbl_mapping_pos_x[0];
> > > +=09=09kbl_mapping_pos_y =3D &sirius_16_ansii_kbl_mapping_pos_y[0];
> > > +=09=09kbl_mapping_pos_z =3D &sirius_16_ansii_kbl_mapping_pos_z[0];
> > > +=09} else if (driver_data->keyboard_type =3D=3D
> > > WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO) {
> > > +=09=09kbl_mapping =3D &sirius_16_iso_kbl_mapping[0];
> > > +=09=09kbl_mapping_pos_x =3D &sirius_16_iso_kbl_mapping_pos_x[0];
> > > +=09=09kbl_mapping_pos_y =3D &sirius_16_iso_kbl_mapping_pos_y[0];
> > > +=09=09kbl_mapping_pos_z =3D &sirius_16_iso_kbl_mapping_pos_z[0];
> > Could these components be put inside another struct so you don't need 3
> > variables to store them?
>=20
> Reworked that a little bit, is now stored in struct tux_hdev_driver_data_=
t
>=20
> struct tux_hdev_driver_data_t {
> =C2=A0=C2=A0=C2=A0 u8 lamp_count;
> =C2=A0=C2=A0=C2=A0 const u8 *kbl_map;
> =C2=A0=C2=A0=C2=A0 const u32 *kbl_map_pos_x;
> =C2=A0=C2=A0=C2=A0 const u32 *kbl_map_pos_y;
> =C2=A0=C2=A0=C2=A0 const u32 *kbl_map_pos_z;
> =C2=A0=C2=A0=C2=A0 u8 next_lamp_id;
> =C2=A0=C2=A0=C2=A0 union tux_wmi_xx_496in_80out_in_t next_kbl_set_multipl=
e_keys_in;
> };
>=20
> initialized only once during ll_start
>=20
> or should go another level and do a nested struct?

I'd prefer the pos ones to be nested as they seem strongly related. It=20
also makes it possible to store it into temporary pointer variable if
that's beneficial somewhere to make the code more readable.

> > > +=09=09for (unsigned int j =3D 0; j <
> > > lamp_multi_update_report.lamp_count; ++j) {
> > > +=09=09=09lamp_multi_update_report.lamp_id[j] =3D i + j;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].red =3D
> > > +=09=09=09=09rep->red_update_channel;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].green =3D
> > > +=09=09=09=09rep->green_update_channel;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].blue =3D
> > > +=09=09=09=09rep->blue_update_channel;
> > > +=09=09=09lamp_multi_update_report.update_channels[j].intensity
> > > =3D
> > > +=09=09=09=09rep->intensity_update_channel;
> > > +=09=09}
> > > +
> > > +=09=09ret =3D handle_lamp_multi_update_report(hdev,
> > > &lamp_multi_update_report);
> > > +=09=09if (ret < 0)
> > > +=09=09=09return ret;
> > > +=09=09else if (ret !=3D sizeof(struct lamp_multi_update_report_t))
> > Unnecessary "else".
>=20
> practically handle_lamp_multi_update_report can only return <0 or the cor=
rect
> size the was i implemented it, but theoretically other values would be wr=
ong
> and this code would document that if in the future other values are possi=
ble
>=20
> I know a somewhat philosophical train of thought. If you want i can just
> delete the else and optionally replace it with a comment about the return
> value.

I think you misunderstood why, I didn't mean remove the whole else if=20
thing.

There's return statement in the if block so else is not required, you can=
=20
do the same without explicit "else":

=09=09if (ret < 0)
=09=09=09return ret;
=09=09if (ret !=3D sizeof(...))
=09=09=09...

> > Take sizeof directly from the related struct variable.
> ack
> >=20
> > > +=09=09=09return -EIO;
> > > +=09}
> > > +
> > > +=09return sizeof(*rep);
> > > +}


> > > +{
> > > +=09/*
> > > +=09 * The keyboards firmware doesn't have any built in controls and =
the
> > > +=09 * built in effects are not implemented so this is a NOOP.
> > > +=09 * According to the HID Documentation (HID Usage Tables v1.5) thi=
s
> > > +=09 * function is optional and can be removed from the HID Report
> > > +=09 * Descriptor, but it should first be confirmed that userspace
> > > respects
> > > +=09 * this possibility too. The Microsoft MacroPad reference
> > > implementation
> > > +=09 * (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
> > > +=09 * already deviates from the spec at another point, see
> > > +=09 * handle_lamp_*_update_report.
> > > +=09 */
> > > +
> > > +=09return sizeof(*rep);
> > > +}
> > > +
> > > +static int tux_ll_raw_request(struct hid_device *hdev, unsigned char
> > > reportnum,
> > > +=09=09=09      __u8 *buf, size_t len, unsigned char rtype,
> > For in-kernel usage, always use non-__ variants, so u8.
> copied that over from the definition in hid.h, but can change it ofc

Yes, use u8.


--=20
 i.

--8323328-443296695-1744738321=:942--

