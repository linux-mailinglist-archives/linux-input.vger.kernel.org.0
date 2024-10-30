Return-Path: <linux-input+bounces-7767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E99B64F3
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 14:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53181C20CB0
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 13:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8C31F8915;
	Wed, 30 Oct 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="MtJRZEKx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LBmdRAnv"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2571F5834;
	Wed, 30 Oct 2024 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730296522; cv=none; b=mjFDdlzwily8ZHrNZ+XLEhkQKxGoetl23LqAHtn8haDC7As9Jv1Cee7dqf8LKBdlcntokDbFF2w7pu6S/jm2fjEpUI6Mg5lOVFluteplyTg4DV4UkfhSJHKxDTyvug6xDFvM2MVokV6KCOD4FAXF1rfBF1njp5spHVaIn7NMLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730296522; c=relaxed/simple;
	bh=iM0/1TsjySmpzoK29E7ZhX5iSPVldsSzoIsHTov5EaA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VLepDC4BI50sEwrSBhobcaqILYpau0MXdcOlMZUHTs40BuX2zuV6pvVD5Z1gOzKcWaaNC6g9z2gT36OxZ3muvf+LXm8/utjj5KAhHqZnyCvqRT88tBb45Im656YlI53UL3k3H1115U4TAULbKHs8P0+yBxflOgG77XtUkUnGtPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=MtJRZEKx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LBmdRAnv; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9FAB92540119;
	Wed, 30 Oct 2024 09:55:16 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Wed, 30 Oct 2024 09:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730296516;
	 x=1730382916; bh=w5foPMucCDoCKxtR0O1ytzXoIj/AgQRy+uRoTORaXTo=; b=
	MtJRZEKxySlT3PDTFKjlkB6r+FAp7UmttBejzrwbUtH2rRlopsFyLLc7A+Zj8e8A
	wrU65L5XmpR2qU6FBPoX+NbzRn9RTGwvRGx+9uNJjOXGfjDzR822ZFwpDo4m96Ye
	0jNxJAoybofkZddKLCxhG0BeZqAdxzfesUQV8B1vCIoTS5zXyTY+kfLf+YnMiU3A
	B6/A/fYYHHBRGTWk+PwSregC0j31xAYnP7tQih+ZoMtxksI8W+73UVd0hLjKtM6L
	74GlXc6rSfWCKYdD32hs8E+RP4e0NeuIFtdQ9dITMsFVMAayLezwaUdOT5OTLYnN
	DQ9AZHM6I6MU/pHbmlHW+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730296516; x=
	1730382916; bh=w5foPMucCDoCKxtR0O1ytzXoIj/AgQRy+uRoTORaXTo=; b=L
	BmdRAnvLAvSHi4B3KTmgeyiQUlR7bNv/vOIEWTlQQZtKGteHlk/GsifzqTu+Zg/Y
	05Jsr/ZCJ3dBiW4kA7rwfXS/jNJ6JZcTJRH81RTXNzSctL1H0gkIv+gwituydoHE
	afeKg1cEp+phBnfsiU+wxvH5RV2NNgrVxOEHniZ62qutIdRFhzLLu43dWx49ocH3
	CJQIPcC4FsoPpMhF/oZzO7ytwwbKfmmjwtA7sNaf5ty9Nn0z7278iAuftTFd7ELd
	fkJvKnapxaD4kGzyowbsaJ9Rl7rBBccTxLfT8MRFQAD7Lab1fedQPHIQ9oNnfWdY
	rB5vVmu4greB3t0VYYvxA==
X-ME-Sender: <xms:xDoiZwib2eyCqyNHKbf9zlnaCi16PyTlp1Oob1pfAuBYV6Qxgu4fUA>
    <xme:xDoiZ5BORn2gWRq7Ihs4VXsXV0-uAwOh7dkAI0d0Z2zfjbhZkOm44em8pvWkX5Ayr
    c6djT7GjmUomiIbj40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeehtedugfelgeeltdevvedtleffhfetgfdtjefhkefg
    udejfeeuueefvdejuddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrihhordhlihhmohhntghivg
    hllhhosegrmhgurdgtohhmpdhrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphho
    rdhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhug
    gvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdq
    ughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xDoiZ4ErpcWqPDKp59c8kBuHc67sHADcy9-5OzGjgGa1box-nDwWyQ>
    <xmx:xDoiZxTYOMpojBoUA1lkgOy6r_pF3r_5d0_P83GoKO6OmDzBgMGxJA>
    <xmx:xDoiZ9y8CfOO_x98k5DxgeiqdsM49uOIOdVoKbiXdTTMUGzZwHw-oQ>
    <xmx:xDoiZ_6tiZ7kgs9LDUNCuz8Gw00aN7mBsXZi5ULM1ORCC3AYvYuDEQ>
    <xmx:xDoiZ8ycIOelkxeuTGylLO9BV_qF7m4KQSMhE5N5h7_Fa8QibP6r4VV5>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 13E933360079; Wed, 30 Oct 2024 09:55:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Oct 2024 14:54:55 +0100
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com,
 "Mario Limonciello" <superm1@kernel.org>,
 "Mario Limonciello" <mario.limonciello@amd.com>
Message-Id: <46cd22c7-e63a-4dde-aa97-f76ac9bb6b8e@app.fastmail.com>
In-Reply-To: <33f4f13f-c5ed-ac89-9243-4356976cc042@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev>
 <20240930000046.51388-9-luke@ljones.dev>
 <33f4f13f-c5ed-ac89-9243-4356976cc042@linux.intel.com>
Subject: Re: [PATCH v6 8/9] platform/x86: asus-armoury: add core count control
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 17 Oct 2024, at 4:41 PM, Ilpo J=C3=A4rvinen wrote:
> On Mon, 30 Sep 2024, Luke D. Jones wrote:
>
>> Implement Intel core enablement under the asus-armoury module using t=
he
>> fw_attributes class.
>>=20
>> This allows users to enable or disable preformance or efficiency cores
>> depending on their requirements. After change a reboot is required.
>>=20
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>  drivers/platform/x86/asus-armoury.c        | 227 +++++++++++++++++++=
++
>>  drivers/platform/x86/asus-armoury.h        |  28 +++
>>  include/linux/platform_data/x86/asus-wmi.h |   4 +
>>  3 files changed, 259 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x=
86/asus-armoury.c
>> index 09e0cbf24f25..caaa55219946 100644
>> --- a/drivers/platform/x86/asus-armoury.c
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -40,6 +40,24 @@
>>  #define ASUS_MINI_LED_2024_STRONG 0x01
>>  #define ASUS_MINI_LED_2024_OFF 0x02
>> =20
>> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
>> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
>
> Align GENMASK()s.

That is how clang-format put them using the .clang-format in the repo. I=
'm not keen on maintaining style manually as it inevitably develops inco=
nsistency.

>> +
>> +enum cpu_core_type {
>> +	CPU_CORE_PERF =3D 0,
>> +	CPU_CORE_POWER,
>> +};
>> +
>> +enum cpu_core_value {
>> +	CPU_CORE_DEFAULT =3D 0,
>> +	CPU_CORE_MIN,
>> +	CPU_CORE_MAX,
>> +	CPU_CORE_CURRENT,
>> +};
>> +
>> +#define CPU_PERF_CORE_COUNT_MIN 4
>> +#define CPU_POWR_CORE_COUNT_MIN 0
>> +
>>  /* Default limits for tunables available on ASUS ROG laptops */
>>  #define NVIDIA_BOOST_MIN 5
>>  #define NVIDIA_BOOST_MAX 25
>> @@ -85,6 +103,13 @@ struct rog_tunables {
>>  	u32 dgpu_tgp_min;
>>  	u32 dgpu_tgp_max;
>>  	u32 dgpu_tgp;
>> +
>> +	u32 cur_perf_cores;
>> +	u32 min_perf_cores;
>> +	u32 max_perf_cores;
>> +	u32 cur_power_cores;
>> +	u32 min_power_cores;
>> +	u32 max_power_cores;
>>  };
>> =20
>>  static const struct class *fw_attr_class;
>> @@ -143,6 +168,8 @@ static struct kobj_attribute pending_reboot =3D _=
_ATTR_RO(pending_reboot);
>>  static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>>  {
>>  	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
>> +	       !strcmp(attr->attr.name, "cores_performance") ||
>> +	       !strcmp(attr->attr.name, "cores_efficiency") ||
>>  	       !strcmp(attr->attr.name, "panel_hd_mode");
>>  }
>> =20
>> @@ -579,6 +606,200 @@ static ssize_t apu_mem_possible_values_show(str=
uct kobject *kobj, struct kobj_at
>>  }
>>  ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM=
 (in GB) for the APU to use");
>> =20
>> +static int init_max_cpu_cores(void)
>> +{
>> +	u32 cores;
>> +	int err;
>> +
>> +	if (!asus_wmi_is_present(ASUS_WMI_DEVID_CORES_MAX))
>> +		return 0;
>> +
>> +
>> +	err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores=
);
>> +	if (err)
>> +		return err;
>> +
>> +	cores &=3D ~ASUS_WMI_DSTS_PRESENCE_BIT;
>
> This looks deadcode.

The asus_wmi_is_present can be removed and is now.

>
>> +	asus_armoury.rog_tunables->max_power_cores =3D FIELD_GET(ASUS_POWER=
_CORE_MASK, cores);
>> +	asus_armoury.rog_tunables->max_perf_cores =3D FIELD_GET(ASUS_PERF_C=
ORE_MASK, cores);
>> +
>> +	cores =3D 0;
>
> Is this needed, you're doing get after all?

I guess not since it is overwritten by call below.

>
>> +	err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
>> +	if (err) {
>> +		pr_err("Could not get CPU core count: error %d", err);
>> +		return err;
>> +	}
>> +
>> +	asus_armoury.rog_tunables->cur_perf_cores =3D FIELD_GET(ASUS_PERF_C=
ORE_MASK, cores);
>> +	asus_armoury.rog_tunables->cur_power_cores =3D FIELD_GET(ASUS_POWER=
_CORE_MASK, cores);
>> +
>> +	asus_armoury.rog_tunables->min_perf_cores =3D CPU_PERF_CORE_COUNT_M=
IN;
>> +	asus_armoury.rog_tunables->min_power_cores =3D CPU_POWR_CORE_COUNT_=
MIN;
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_at=
tribute *attr, char *buf,
>> +				enum cpu_core_type core_type, enum cpu_core_value core_value)
>> +{
>> +	u32 cores;
>> +
>> +	switch (core_value) {
>> +	case CPU_CORE_DEFAULT:
>> +	case CPU_CORE_MAX:
>> +		if (core_type =3D=3D CPU_CORE_PERF)
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->max_perf_cores);
>> +		else
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->max_power_cores);
>> +	case CPU_CORE_MIN:
>> +		if (core_type =3D=3D CPU_CORE_PERF)
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->min_perf_cores);
>> +		else
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->min_power_cores);
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (core_type =3D=3D CPU_CORE_PERF)
>> +		cores =3D asus_armoury.rog_tunables->cur_perf_cores;
>> +	else
>> +		cores =3D asus_armoury.rog_tunables->cur_power_cores;
>> +
>> +	return sysfs_emit(buf, "%d\n", cores);
>> +}
>> +
>> +static ssize_t cores_current_value_store(struct kobject *kobj, struc=
t kobj_attribute *attr,
>> +					 const char *buf, enum cpu_core_type core_type)
>> +{
>> +	int result, err;
>> +	u32 new_cores, perf_cores, powr_cores, out_val, min, max;
>
> Please be consistent with the struct field naming and use "power_cores=
".

Ack.

Luke.
>
> --=20
>  i.
>
>> +
>> +	result =3D kstrtou32(buf, 10, &new_cores);
>> +	if (result)
>> +		return result;
>> +
>> +	if (core_type =3D=3D CPU_CORE_PERF) {
>> +		perf_cores =3D new_cores;
>> +		powr_cores =3D out_val =3D asus_armoury.rog_tunables->cur_power_co=
res;
>> +		min =3D asus_armoury.rog_tunables->min_perf_cores;
>> +		max =3D asus_armoury.rog_tunables->max_perf_cores;
>> +	} else {
>> +		perf_cores =3D asus_armoury.rog_tunables->cur_perf_cores;
>> +		powr_cores =3D out_val =3D new_cores;
>> +		min =3D asus_armoury.rog_tunables->min_power_cores;
>> +		max =3D asus_armoury.rog_tunables->max_power_cores;
>> +	}
>> +
>> +	if (new_cores < min || new_cores > max)
>> +		return -EINVAL;
>> +
>> +	out_val =3D 0;
>> +	out_val |=3D FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores);
>> +	out_val |=3D FIELD_PREP(ASUS_POWER_CORE_MASK, powr_cores);
>> +
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &resul=
t);
>> +	mutex_unlock(&asus_armoury.mutex);
>> +
>> +	if (err) {
>> +		pr_warn("Failed to set CPU core count: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (result > 1) {
>> +		pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
>> +		return -EIO;
>> +	}
>> +
>> +	pr_info("CPU core count changed, reboot required\n");
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +	asus_set_reboot_and_signal_event();
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>> +						struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MI=
N);
>> +}
>> +
>> +static ssize_t cores_performance_max_value_show(struct kobject *kobj,
>> +						struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MA=
X);
>> +}
>> +
>> +static ssize_t cores_performance_default_value_show(struct kobject *=
kobj,
>> +						    struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DE=
FAULT);
>> +}
>> +
>> +static ssize_t cores_performance_current_value_show(struct kobject *=
kobj,
>> +						    struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CU=
RRENT);
>> +}
>> +
>> +static ssize_t cores_performance_current_value_store(struct kobject =
*kobj,
>> +						     struct kobj_attribute *attr,
>> +						     const char *buf, size_t count)
>> +{
>> +	int err;
>> +
>> +	err =3D cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>> +		    "Set the max available performance cores");
>> +
>> +static ssize_t cores_efficiency_min_value_show(struct kobject *kobj,=
 struct kobj_attribute *attr,
>> +					       char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_M=
IN);
>> +}
>> +
>> +static ssize_t cores_efficiency_max_value_show(struct kobject *kobj,=
 struct kobj_attribute *attr,
>> +					       char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_M=
AX);
>> +}
>> +
>> +static ssize_t cores_efficiency_default_value_show(struct kobject *k=
obj,
>> +						   struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_D=
EFAULT);
>> +}
>> +
>> +static ssize_t cores_efficiency_current_value_show(struct kobject *k=
obj,
>> +						   struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_C=
URRENT);
>> +}
>> +
>> +static ssize_t cores_efficiency_current_value_store(struct kobject *=
kobj,
>> +						    struct kobj_attribute *attr, const char *buf,
>> +						    size_t count)
>> +{
>> +	int err;
>> +
>> +	err =3D cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>> +		    "Set the max available efficiency cores");
>> +
>>  /* Simple attribute creation */
>>  ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PP=
T_PL1_SPL, cpu_default,
>>  		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
>> @@ -635,6 +856,8 @@ static const struct asus_attr_group armoury_attr_=
groups[] =3D {
>>  	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
>>  	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
>>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>> +	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>> +	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>> =20
>>  	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>>  	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>> @@ -752,6 +975,7 @@ static void init_rog_tunables(struct rog_tunables=
 *rog)
>>  	 * "ROG Flow X16 GV601VV_GV601VV_00185149B".
>>  	 * The bulk of these defaults are gained from users reporting what
>>  	 * ASUS Armoury Crate in Windows provides them.
>> +	 * This should be turned in to a tabe eventually.
>>  	 */
>>  	product =3D dmi_get_system_info(DMI_PRODUCT_NAME);
>> =20
>> @@ -836,6 +1060,9 @@ static int __init asus_fw_init(void)
>>  		return -ENOMEM;
>> =20
>>  	init_rog_tunables(asus_armoury.rog_tunables);
>> +	err =3D init_max_cpu_cores();
>> +	if (err)
>> +		return err;
>> =20
>>  	err =3D asus_fw_attr_add();
>>  	if (err)
>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x=
86/asus-armoury.h
>> index e08459cad942..04b88f7d2421 100644
>> --- a/drivers/platform/x86/asus-armoury.h
>> +++ b/drivers/platform/x86/asus-armoury.h
>> @@ -167,6 +167,34 @@ static ssize_t enum_type_show(struct kobject *ko=
bj, struct kobj_attribute *attr,
>>  		.name =3D _fsname, .attrs =3D _attrname##_attrs               \
>>  	}
>> =20
>> +/* CPU core attributes need a little different in setup */
>> +#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)          =
    \
>> +	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>> +	static struct kobj_attribute attr_##_attrname##_current_value =3D \
>> +		__ASUS_ATTR_RW(_attrname, current_value);               \
>> +	static struct kobj_attribute attr_##_attrname##_default_value =3D \
>> +		__ASUS_ATTR_RO(_attrname, default_value);               \
>> +	static struct kobj_attribute attr_##_attrname##_min_value =3D     \
>> +		__ASUS_ATTR_RO(_attrname, min_value);                   \
>> +	static struct kobj_attribute attr_##_attrname##_max_value =3D     \
>> +		__ASUS_ATTR_RO(_attrname, max_value);                   \
>> +	static struct kobj_attribute attr_##_attrname##_type =3D          \
>> +		__ASUS_ATTR_RO_AS(type, int_type_show);                 \
>> +	static struct attribute *_attrname##_attrs[] =3D {                \
>> +		&attr_##_attrname##_current_value.attr,                 \
>> +		&attr_##_attrname##_default_value.attr,                 \
>> +		&attr_##_attrname##_min_value.attr,                     \
>> +		&attr_##_attrname##_max_value.attr,                     \
>> +		&attr_##_attrname##_scalar_increment.attr,              \
>> +		&attr_##_attrname##_display_name.attr,                  \
>> +		&attr_##_attrname##_type.attr,                          \
>> +		NULL                                                    \
>> +	};                                                              \
>> +	static const struct attribute_group _attrname##_attr_group =3D {  \
>> +		.name =3D _fsname, .attrs =3D _attrname##_attrs             \
>> +	}
>> +
>>  /*
>>   * ROG PPT attributes need a little different in setup as they
>>   * require rog_tunables members.
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/lin=
ux/platform_data/x86/asus-wmi.h
>> index 88bf250dc8ca..cc21e4272460 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -137,6 +137,10 @@
>>  /* dgpu on/off */
>>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>> =20
>> +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
>> +#define ASUS_WMI_DEVID_CORES		0x001200D2
>> + /* Maximum Intel E-core and P-core availability */
>> +#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
>>  #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
>>  #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
>>  #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
>>

