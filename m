Return-Path: <linux-input+bounces-8523-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD579EF3E1
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 18:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2DC717D517
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D480323A19D;
	Thu, 12 Dec 2024 16:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcqNJ2SM"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37523A187;
	Thu, 12 Dec 2024 16:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734022030; cv=none; b=qW5hLk9S7wqNtMw6rs3TJcP/3aB9aExJhGR9Tbv0Y1aPJOppiblO1og7B45fUkRoy1nrPlihEl4Czfx2rftcnGnBJaQBd0Ql8qwO8axzxceYN/Z6nGdX7ZgNGJ1FBdWkWS7r7CUjuqL7MnlZCg7Cg/FodfoBML5qhEbBJmTPDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734022030; c=relaxed/simple;
	bh=yGjhiV9R8XgmrAnClQpCMGoAHgaU+9z+Q96HcObkhSk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fkq6yh3YUthQv3kHJCQMC0FKrt/3IAh6KMIVFbB/p3OZXFsABJ30Zockxk2Ij1O3vjHOWPG0JO35rIIcoZYL0Yz3R1BrITOjbFnqKp3GIdmsbaE80E/B/91sy6Bg8taPAy1zrI/h6cN3XdlqDOBf6XcdKWzYmOOxUoy4hbK5giM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcqNJ2SM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734022028; x=1765558028;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=yGjhiV9R8XgmrAnClQpCMGoAHgaU+9z+Q96HcObkhSk=;
  b=TcqNJ2SMKY4MdDc13DTo1Y6N6Q8D+wcSfIHTEv4/o2cAWA0eyLNrTkMI
   atIlV/U6qdt4U3I2ygUJzzy+XTuPFIPYkoyxe/gwyw/nrBZuV0sqCEXxO
   tKhHqXfDcOxZRj1VNpYtWw9vJ4gUZVswZkUPTQQu7DNlWfRN5S8CYa0Ev
   IxgEX+YpSPoG2krizdPgTec4R7E9xVyFotXcsuNVR62XvAqHS3eBMVl1C
   WgMadn02XTc5G1JkpGFuq1CWsZnnHXy0/Anel4jfNWTeSLp+soYxVs1Wp
   hHBGYFmrJbG4nA1v7OtHeB6QRTTQ313KBdjOXJHiZDDCfyogvwZDbJHFb
   A==;
X-CSE-ConnectionGUID: 8vsgmWeVRruv8dHfKSPa2g==
X-CSE-MsgGUID: iogPoevISMe15m6lKqc0ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34359030"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="34359030"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:47:08 -0800
X-CSE-ConnectionGUID: rQrWQi5ARamtDeNcE1I+lQ==
X-CSE-MsgGUID: DE8X+LKBQS6fHgJlQ1N9nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; 
   d="scan'208";a="96019426"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.137])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 08:47:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Dec 2024 18:47:00 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
    Akshata MukundShetty <akshata.mukundshetty@amd.com>, 
    Patil Rajesh Reddy <patreddy@amd.com>, platform-driver-x86@vger.kernel.org, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: amd_sfh: Add support to export device operating
 states
In-Reply-To: <a16764a3-744b-4a55-86af-777de02ff999@amd.com>
Message-ID: <1e9aad0f-73bd-74a4-1a96-3543419b4fc3@linux.intel.com>
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com> <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com> <1b3dacc1-37bd-49cc-addc-628e843a5af8@amd.com> <a16764a3-744b-4a55-86af-777de02ff999@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1362301288-1734021357=:936"
Content-ID: <0c848b9a-2154-473f-eff4-4f62b1c307cb@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1362301288-1734021357=:936
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5a3c0e9b-d75d-5eec-92c6-9705eed706fa@linux.intel.com>

On Thu, 12 Dec 2024, Shyam Sundar S K wrote:
> On 12/12/2024 21:16, Mario Limonciello wrote:
> > On 12/12/2024 09:19, Shyam Sundar S K wrote:
> >> From: Basavaraj Natikar <basavaraj.natikar@amd.com>
> >>
> >> Add support to export device operating states, such as laptop
> >> placement,
> >> platform types and propagate this data to AMD PMF driver for use in
> >> actions.
> >>
> >> To retrieve the device operating states data, SRA sensor support
> >> need to
> >> be enabled in AMD SFH driver. So add support to enable the SRA sensor.
> >>
> >> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> >> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> >> Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
> >=20
> > When you send someone else's patch but don't change it you are still
> > supposed to add your "own" S-o-b.
>=20
> ah! Thanks. I missed to add it.
>=20
> >=20
> > I have two small nits below.
> >=20
>=20
> Sure, but I have a question to Hans and Ilpo
>=20
> while we address the remarks what should be approach for merging this
> series? Should it go via pdx86 tree or hid because patch 2/2 is
> dependent of 1/2.

Hi,

Given pdx86 pmf driver gets much more changes overall, it would seem=20
better to merge the series through pdx86 tree. But I also want to mention=
=20
that generally it's also possible to make requests on merge path as the=20
submitter of the series, in particular, it is good to take into account
if you know there are patches that might conflict with the changes=20
(within this kernel cycle) to make the merge window less problematic for=20
maintainers.

[In some cases it's possible to create an immutable branch which can be=20
merged by two (or more) subsystems but I don't think it provides added=20
value here given how low traffic amd-sfh-hid is.]

--=20
 i.

> >> ---
> >> =A0 drivers/hid/amd-sfh-hid/amd_sfh_common.h=A0=A0=A0=A0=A0 |=A0 1 +
> >> =A0 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 ++++++++++++
> >> =A0 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c=A0=A0=A0 | 35 +++++++++=
++++++
> >> ++++
> >> =A0 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h=A0=A0=A0 | 20 +++++++++=
++
> >> =A0 include/linux/amd-pmf-io.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 15 ++++++++
> >> =A0 5 files changed, 93 insertions(+)
> >>
> >> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/
> >> amd-sfh-hid/amd_sfh_common.h
> >> index e5620d7db569..799b8686a88a 100644
> >> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> >> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> >> @@ -43,6 +43,7 @@ struct amd_mp2_sensor_info {
> >> =A0 struct sfh_dev_status {
> >> =A0=A0=A0=A0=A0 bool is_hpd_present;
> >> =A0=A0=A0=A0=A0 bool is_als_present;
> >> +=A0=A0=A0 bool is_sra_present;
> >> =A0 };
> >> =A0 =A0 struct amd_mp2_dev {
> >> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/
> >> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> >> index db36d87d5634..03c028f1aab4 100644
> >> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> >> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> >> @@ -30,6 +30,7 @@ static int amd_sfh_get_sensor_num(struct
> >> amd_mp2_dev *mp2, u8 *sensor_id)
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 case ACCEL_IDX:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 case GYRO_IDX:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 case MAG_IDX:
> >> +=A0=A0=A0=A0=A0=A0=A0 case SRA_IDX:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 case ALS_IDX:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 case HPD_IDX:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (BIT(i) & slist->sl.sensors=
)
> >> @@ -58,6 +59,8 @@ static const char *get_sensor_name(int idx)
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return "gyroscope";
> >> =A0=A0=A0=A0=A0 case MAG_IDX:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return "magnetometer";
> >> +=A0=A0=A0 case SRA_IDX:
> >> +=A0=A0=A0=A0=A0=A0=A0 return "SRA";
> >> =A0=A0=A0=A0=A0 case ALS_IDX:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return "ALS";
> >> =A0=A0=A0=A0=A0 case HPD_IDX:
> >> @@ -130,6 +133,23 @@ static int amd_sfh1_1_hid_client_init(struct
> >> amd_mp2_dev *privdata)
> >> =A0 =A0=A0=A0=A0=A0 for (i =3D 0; i < cl_data->num_hid_devices; i++) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 cl_data->sensor_sts[i] =3D SENSOR_DISABLED=
;
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 if (cl_data->num_hid_devices =3D=3D 1 && cl_dat=
a->sensor_idx[0]
> >> =3D=3D SRA_IDX)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0 if (cl_data->sensor_idx[i] =3D=3D SRA_IDX) {
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 info.sensor_idx =3D cl_data->sensor=
_idx[i];
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 writel(0, privdata->mmio + amd_get_=
p2c_val(privdata, 0));
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mp2_ops->start(privdata, info);
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D amd_sfh_wait_for_respons=
e
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (privdata, cl_data->sen=
sor_idx[i], ENABLE_SENSOR);
> >> +
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cl_data->sensor_sts[i] =3D (status =
=3D=3D 0) ?
> >> SENSOR_ENABLED : SENSOR_DISABLED;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (cl_data->sensor_sts[i] =3D=3D S=
ENSOR_ENABLED)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 privdata->dev_en.is_sra=
_present =3D true;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> >> +=A0=A0=A0=A0=A0=A0=A0 }
> >> +
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 cl_data->sensor_requested_cnt[i] =3D 0;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 cl_data->cur_hid_dev =3D i;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 cl_idx =3D cl_data->sensor_idx[i];
> >> @@ -181,6 +201,8 @@ static int amd_sfh1_1_hid_client_init(struct
> >> amd_mp2_dev *privdata)
> >> =A0=A0=A0=A0=A0 }
> >> =A0 =A0=A0=A0=A0=A0 for (i =3D 0; i < cl_data->num_hid_devices; i++) {
> >> +=A0=A0=A0=A0=A0=A0=A0 if (cl_data->sensor_idx[i] =3D=3D SRA_IDX)
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 cl_data->cur_hid_dev =3D i;
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 if (cl_data->sensor_sts[i] =3D=3D SENSOR_E=
NABLED) {
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cl_data->is_any_sensor_enabled=
 =3D true;
> >> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/
> >> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> >> index 4676f060da26..b4c0d96ab152 100644
> >> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> >> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> >> @@ -87,6 +87,38 @@ void sfh_interface_init(struct amd_mp2_dev *mp2)
> >> =A0=A0=A0=A0=A0 emp2 =3D mp2;
> >> =A0 }
> >> =A0 +static int amd_sfh_mode_info(u32 *platform_type, u32
> >> *laptop_placement)
> >> +{
> >> +=A0=A0=A0 struct sfh_op_mode mode;
> >> +
> >> +=A0=A0=A0 if (!platform_type || !laptop_placement)
> >> +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> >> +
> >> +=A0=A0=A0 if (!emp2 || !emp2->dev_en.is_sra_present)
> >> +=A0=A0=A0=A0=A0=A0=A0 return -ENODEV;
> >> +
> >> +=A0=A0=A0 mode.val =3D readl(emp2->mmio + amd_get_c2p_val(emp2, 3));
> >> +
> >> +=A0=A0=A0 *platform_type =3D mode.op_mode.devicemode;
> >> +
> >> +=A0=A0=A0 if (mode.op_mode.ontablestate =3D=3D 1)
> >> +=A0=A0=A0=A0=A0=A0=A0 *laptop_placement =3D ON_TABLE;
> >> +=A0=A0=A0 else if (mode.op_mode.ontablestate =3D=3D 2)
> >> +=A0=A0=A0=A0=A0=A0=A0 *laptop_placement =3D ON_LAP_MOTION;
> >> +=A0=A0=A0 else if (mode.op_mode.inbagstate =3D=3D 1)
> >> +=A0=A0=A0=A0=A0=A0=A0 *laptop_placement =3D IN_BAG;
> >> +=A0=A0=A0 else if (mode.op_mode.outbagstate =3D=3D 1)
> >> +=A0=A0=A0=A0=A0=A0=A0 *laptop_placement =3D OUT_OF_BAG;
> >> +=A0=A0=A0 else if (mode.op_mode.ontablestate =3D=3D 0 ||
> >> mode.op_mode.inbagstate =3D=3D 0 ||
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 mode.op_mode.outbagstate =3D=3D 0)
> >> +=A0=A0=A0=A0=A0=A0=A0 *laptop_placement =3D LP_UNKNOWN;
> >> +=A0=A0=A0 else if (mode.op_mode.ontablestate =3D=3D 3 ||
> >> mode.op_mode.inbagstate =3D=3D 3 ||
> >> +=A0=A0=A0=A0=A0=A0=A0=A0 mode.op_mode.outbagstate =3D=3D 3)
> >> +=A0=A0=A0=A0=A0=A0=A0 *laptop_placement =3D LP_UNDEFINED;
> >=20
> > What do you think of doing a pr_warn_once() when you end up with an
> > undefined placement?=A0 This could help point out that the driver needs
> > to be changed for a newly created mode that the hardware detected.
> >=20
> >> +
> >> +=A0=A0=A0 return 0;
> >> +}
> >> +
> >> =A0 static int amd_sfh_hpd_info(u8 *user_present)
> >> =A0 {
> >> =A0=A0=A0=A0=A0 struct hpd_status hpdstatus;
> >> @@ -131,6 +163,9 @@ int amd_get_sfh_info(struct amd_sfh_info
> >> *sfh_info, enum sfh_message_type op)
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return amd_sfh_hpd_info(&sfh_i=
nfo->user_present);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 case MT_ALS:
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return amd_sfh_als_info(&sfh_i=
nfo->ambient_light);
> >> +=A0=A0=A0=A0=A0=A0=A0 case MT_SRA:
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return amd_sfh_mode_info(&sfh_info-=
>platform_type,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 &sfh_info->laptop_placement);
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> >> =A0=A0=A0=A0=A0 }
> >> =A0=A0=A0=A0=A0 return -EINVAL;
> >> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/
> >> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> >> index 2c211d28764d..f7eb2539bccc 100644
> >> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> >> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> >> @@ -22,6 +22,7 @@ enum sensor_index {
> >> =A0=A0=A0=A0=A0 ACCEL_IDX,
> >> =A0=A0=A0=A0=A0 GYRO_IDX,
> >> =A0=A0=A0=A0=A0 MAG_IDX,
> >> +=A0=A0=A0 SRA_IDX,
> >> =A0=A0=A0=A0=A0 ALS_IDX =3D 4,
> >> =A0=A0=A0=A0=A0 HPD_IDX =3D 5,
> >=20
> > IIRC in C enums start at 0 right?=A0 So ALS_IDX and HPD_IDX don't need
> > explicit assingments anymore.
> >=20
> >> =A0=A0=A0=A0=A0 MAX_IDX =3D 15,
> >> @@ -164,6 +165,25 @@ struct hpd_status {
> >> =A0=A0=A0=A0=A0 };
> >> =A0 };
> >> =A0 +struct sfh_op_mode {
> >> +=A0=A0=A0 union {
> >> +=A0=A0=A0=A0=A0=A0=A0 u32 val;
> >> +=A0=A0=A0=A0=A0=A0=A0 struct {
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 mode=A0=A0=A0=A0=A0=A0=A0 : 3;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 lidstatus=A0=A0=A0=A0=A0=A0=A0 =
: 1;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 angle=A0=A0=A0=A0=A0=A0=A0 : 10=
;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 inbagstatedbg=A0=A0=A0 : 2;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 ontablestate=A0=A0=A0 : 2;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 inbagstate=A0=A0=A0=A0=A0=A0=A0=
 : 2;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 outbagstate=A0=A0=A0=A0=A0=A0=
=A0 : 2;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 inbagmlcstate=A0=A0=A0 : 1;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 powerstate=A0=A0=A0=A0=A0=A0=A0=
 : 2;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 data=A0=A0=A0=A0=A0=A0=A0 : 3;
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 devicemode=A0=A0=A0=A0=A0=A0=A0=
 : 4;
> >> +=A0=A0=A0=A0=A0=A0=A0 } op_mode;
> >> +=A0=A0=A0 };
> >> +};
> >> +
> >> =A0 void sfh_interface_init(struct amd_mp2_dev *mp2);
> >> =A0 void sfh_deinit_emp2(void);
> >> =A0 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
> >> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> >> index b4f818205216..01f2b12c56a6 100644
> >> --- a/include/linux/amd-pmf-io.h
> >> +++ b/include/linux/amd-pmf-io.h
> >> @@ -18,10 +18,12 @@
> >> =A0=A0 * enum sfh_message_type - Query the SFH message type
> >> =A0=A0 * @MT_HPD: Message ID to know the Human presence info from MP2 =
FW
> >> =A0=A0 * @MT_ALS: Message ID to know the Ambient light info from MP2 F=
W
> >> + * @MT_SRA: Message ID to know the SRA data from MP2 FW
> >> =A0=A0 */
> >> =A0 enum sfh_message_type {
> >> =A0=A0=A0=A0=A0 MT_HPD,
> >> =A0=A0=A0=A0=A0 MT_ALS,
> >> +=A0=A0=A0 MT_SRA,
> >> =A0 };
> >> =A0 =A0 /**
> >> @@ -40,10 +42,23 @@ enum sfh_hpd_info {
> >> =A0=A0 * struct amd_sfh_info - get HPD sensor info from MP2 FW
> >> =A0=A0 * @ambient_light: Populates the ambient light information
> >> =A0=A0 * @user_present: Populates the user presence information
> >> + * @platform_type: Operating modes (clmashell, flat, tent, etc.)
> >> + * @laptop_placement: Device states (ontable, onlap, outbag)
> >> =A0=A0 */
> >> =A0 struct amd_sfh_info {
> >> =A0=A0=A0=A0=A0 u32 ambient_light;
> >> =A0=A0=A0=A0=A0 u8 user_present;
> >> +=A0=A0=A0 u32 platform_type;
> >> +=A0=A0=A0 u32 laptop_placement;
> >> +};
> >> +
> >> +enum laptop_placement {
> >> +=A0=A0=A0 LP_UNKNOWN =3D 0,
> >> +=A0=A0=A0 ON_TABLE,
> >> +=A0=A0=A0 ON_LAP_MOTION,
> >> +=A0=A0=A0 IN_BAG,
> >> +=A0=A0=A0 OUT_OF_BAG,
> >> +=A0=A0=A0 LP_UNDEFINED,
> >> =A0 };
> >> =A0 =A0 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum
> >> sfh_message_type op);
> >=20
>=20
--8323328-1362301288-1734021357=:936--

