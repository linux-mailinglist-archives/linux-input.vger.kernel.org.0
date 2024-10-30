Return-Path: <linux-input+bounces-7771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39C9B67A4
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 16:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF1F21C217FB
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 15:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD98C224419;
	Wed, 30 Oct 2024 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQSA+3pT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A62223A65;
	Wed, 30 Oct 2024 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730301483; cv=none; b=dtyQZ0Qp/RDIN3rLe3ubUDvmkjx5uShCHGLBa1ijce0rn78S8mHCF5b2VjYYMxl4lZYNPvPtQ5SH7NIIHM415QMy2DRDTuYjTINHNK9IEOH6XVc/hXoAiGJOaSKXHNR62nuWKTyv9ekr/z4Mr/BkJkjjrNNo7Un8HEWxYENxIY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730301483; c=relaxed/simple;
	bh=Fwpf+JGHjawLplTDTAXy4r/4spztfbQjTtv/ahRIgKI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UT6JIbiY/ZTxhW0r2RZX7fiL/WNk8FaaGddfNElE0i/6tiFTy4DRAkkL2JxnlboX0bpmjG74Sbx2FRhdxovoHsDGJZi3/5fZcMdth1ZzG+yRi7+3cdTTgJgDcrHXycaAc2W759QcCm7SL5SVYV46OwO40HG8WJAwywWzKixbuDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQSA+3pT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730301482; x=1761837482;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Fwpf+JGHjawLplTDTAXy4r/4spztfbQjTtv/ahRIgKI=;
  b=AQSA+3pTohFe7+oo0XkvufuNKQIjdnJOmEx8/GwYGx8Q+3nRtg4wDqVO
   N9QZpK8Uw/0Ge3HuJ6NQqNPn/svpgoacLYvsbeaMj05KjvNKdSGcmT6ui
   odOfPrD2mo+md5fIids0gQ8nZkldDUfu6SVvGct4pJ3W9kjAJd2RHNPPB
   gXpVcNjnrXGvb2Bil3Bxe5S7LmfnB1k3GlQiNJ32lwEW3esmTVG/DL7Cz
   VO/hEKsexRY5fLEjqFujSjVJdg/ZVgLO6UbTV4yYjv18YgldDD2iyRRx8
   x0zHVUJoTH89IR7Pfva/F9yptviDfwwh5iAdZKRdPvMsqHrh7EavI82U3
   Q==;
X-CSE-ConnectionGUID: yRQOXhJZSd2BWULoriOQsA==
X-CSE-MsgGUID: DYexOUYqRUCwy0xz/N8vHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29454200"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29454200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 08:18:00 -0700
X-CSE-ConnectionGUID: Rx1xxJB5SieuGWzAbwqPyA==
X-CSE-MsgGUID: y9tGCpAuRnCSAecGhw/xaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82660549"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 08:17:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Oct 2024 17:17:53 +0200 (EET)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    Jiri Kosina <jikos@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH v6 3/9] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
In-Reply-To: <19eefea4-d3b1-436a-8364-3f56a56b83cb@app.fastmail.com>
Message-ID: <c6a37dc9-8dd6-19fc-f004-4818116d062e@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev> <20240930000046.51388-4-luke@ljones.dev> <6edbf781-b959-e2b5-bbb5-24282f239fc4@linux.intel.com> <19eefea4-d3b1-436a-8364-3f56a56b83cb@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1218864694-1730300699=:1102"
Content-ID: <2a4d2c0f-88b1-6b4e-54e9-18e2bf31deaf@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1218864694-1730300699=:1102
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <3626c747-94ce-75f3-b6ac-c3f76374988d@linux.intel.com>

On Wed, 30 Oct 2024, Luke Jones wrote:
> On Wed, 16 Oct 2024, at 4:54 PM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 30 Sep 2024, Luke D. Jones wrote:
> >
> >> The fw_attributes_class provides a much cleaner interface to all of th=
e
> >> attributes introduced to asus-wmi. This patch moves all of these extra
> >> attributes over to fw_attributes_class, and shifts the bulk of these
> >> definitions to a new kernel module to reduce the clutter of asus-wmi
> >> with the intention of deprecating the asus-wmi attributes in future.
> >>=20
> >> The work applies only to WMI methods which don't have a clearly define=
d
> >> place within the sysfs and as a result ended up lumped together in
> >> /sys/devices/platform/asus-nb-wmi/ with no standard API.
> >>=20
> >> Where possible the fw attrs now implement defaults, min, max, scalar,
> >> choices, etc. As en example dgpu_disable becomes:
> >>=20
> >> /sys/class/firmware-attributes/asus-armoury/attributes/dgpu_disable/
> >> =E2=94=9C=E2=94=80=E2=94=80 current_value
> >> =E2=94=9C=E2=94=80=E2=94=80 display_name
> >> =E2=94=9C=E2=94=80=E2=94=80 possible_values
> >> =E2=94=94=E2=94=80=E2=94=80 type
> >>=20
> >> as do other attributes.
> >>=20
> >> The ppt_* based attributes are removed in this initial patch as the
> >> implementation is somewhat broken due to the WMI methods requiring a
> >> set of limits on the values accepted (which is not provided by WMI).
> >>=20
> >> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> >> ---
> >>  drivers/platform/x86/Kconfig               |  12 +
> >>  drivers/platform/x86/Makefile              |   1 +
> >>  drivers/platform/x86/asus-armoury.c        | 593 ++++++++++++++++++++=
+
> >>  drivers/platform/x86/asus-armoury.h        | 146 +++++
> >>  drivers/platform/x86/asus-wmi.c            |   4 -
> >>  include/linux/platform_data/x86/asus-wmi.h |   3 +
> >>  6 files changed, 755 insertions(+), 4 deletions(-)
> >>  create mode 100644 drivers/platform/x86/asus-armoury.c
> >>  create mode 100644 drivers/platform/x86/asus-armoury.h
> >>=20
> >> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
> >> index 3875abba5a79..80ec8b45022d 100644
> >> --- a/drivers/platform/x86/Kconfig
> >> +++ b/drivers/platform/x86/Kconfig
> >> @@ -265,6 +265,18 @@ config ASUS_WIRELESS
> >>  =09  If you choose to compile this driver as a module the module will=
 be
> >>  =09  called asus-wireless.
> >> =20
> >> +config ASUS_ARMOURY
> >> +=09tristate "ASUS Armoury driver"
> >> +=09depends on ASUS_WMI
> >> +=09select FW_ATTR_CLASS
> >> +=09help
> >> +=09  Say Y here if you have a WMI aware Asus machine and would like t=
o use the
> >> +=09  firmware_attributes API to control various settings typically ex=
posed in
> >> +=09  the ASUS Armoury Crate application available on Windows.
> >> +
> >> +=09  To compile this driver as a module, choose M here: the module wi=
ll
> >> +=09  be called asus-armoury.
> >> +
> >>  config ASUS_WMI
> >>  =09tristate "ASUS WMI Driver"
> >>  =09depends on ACPI_WMI

> >> +static const struct class *fw_attr_class;
> >> +
> >> +struct asus_armoury_priv {
> >> +=09struct device *fw_attr_dev;
> >> +=09struct kset *fw_attr_kset;
> >> +
> >> +=09u32 mini_led_dev_id;
> >> +=09u32 gpu_mux_dev_id;
> >> +
> >> +=09struct mutex mutex;
> >
> > Please document what this protects.
>=20
> I don't fully understand if sysfs writes can be parallel or not, so i=20
> was making the assumption that they were and if so, we would want to=20
> prevent trying to write many WMI at once. If my understanding is lacking=
=20
> please correct me.

Yes, sysfs write handlers can run parallel so locking necessary.

I believe your mutex is okay solution for concurrency control but you need=
=20
to add a comment on what it protects. It could be also named like=20
wmi_mutex if it's for that only.

> >> +static int asus_fw_attr_add(void)
> >> +{
> >> +=09int err, i;
> >> +
> >> +=09err =3D fw_attributes_class_get(&fw_attr_class);
> >> +=09if (err)
> >> +=09=09return err;
> >> +
> >> +=09asus_armoury.fw_attr_dev =3D
> >> +=09=09device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", DRI=
VER_NAME);
> >
> > Don't split at =3D but after MKDEV() arg.
>=20
> This is another clang-format thing... I'll bite the bullet and manually=
=20
> format for rest of style suggestions in review.

If you want to attempt to keep using it, I suggest you try to look if you=
=20
can make small adjustment to its config file to solve its worst misses.

> >> +static void __exit asus_fw_exit(void)
> >> +{
> >> +=09mutex_lock(&asus_armoury.mutex);
> >
> > I'm not sure if this really helps anything. What are you trying to prot=
ect=20
> > against here with it?
>=20
> I'm not even sure anymore. Was supposed to be due to my assumptions=20
> about how sysfs writes work.

It doesn't help any. Either you'd deadlock when calling=20
sysfs_remove_file() (assuming its waiting for the handlers to finish) or=20
the write handler is still executed after unlock which equals not taking=20
mutex here at all. I don't see what it could protect with any success.

> One thing in particular is that the dgpu_disable and egpu_enable calls=20
> can take 20+ seconds to complete in acpi, and I don't want to make other=
=20
> WMI calls during that time - TBH I'm not sure of best way to handle it.
>
> >> +=09sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboo=
t.attr);
> >> +=09kset_unregister(asus_armoury.fw_attr_kset);
> >> +=09device_destroy(fw_attr_class, MKDEV(0, 0));
> >> +=09fw_attributes_class_put();
> >> +
> >> +=09mutex_unlock(&asus_armoury.mutex);
> >> +}


--=20
 i.
--8323328-1218864694-1730300699=:1102--

