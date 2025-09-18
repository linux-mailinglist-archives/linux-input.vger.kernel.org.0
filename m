Return-Path: <linux-input+bounces-14865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D2B86ABD
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 21:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 111EC1C882A3
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 19:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA64F1DDC2B;
	Thu, 18 Sep 2025 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIuk9/Eo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B1935947
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758223633; cv=none; b=lJjc4cy5lMqF0N4UtyXgG31cUY3/PY5cY6UbocDLMB5ITSfrissRoFmcTUbd+84tyvunLicGrjd+r98TZgxJ0hMftv1YTGRKkVP2eNab1F/DJVTOysXUxejUp4SJRk0F0rgfnlUiPukupREMqn0gnnOmxUWKJf11mgWbf3YwMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758223633; c=relaxed/simple;
	bh=Z5KB1DtG0F8xBTY8ig6GaF3uuFBfewpKbjU1oHisSHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8y3WedLc+uy7+9eyZZVEFfg54zixu/V//xgifdqs+Ltn9ounbqflXXFAWfJtipvmH9LKsYj6K496XCaFMqMp//04lnwtQn2GPMcFT3pk/Y0wghmSHyLe3TouwR+PXbFqV2Yd4dQipnuG4p5Gaz8yJlI9vOcGQQb0o5mx2z5X60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIuk9/Eo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DE4C4CEE7;
	Thu, 18 Sep 2025 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758223633;
	bh=Z5KB1DtG0F8xBTY8ig6GaF3uuFBfewpKbjU1oHisSHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TIuk9/Eok7DPkMADWq1sp+VWBQXrTqN8Z6PKIY/cpxthEI1jDyvaSzMPcMhJflqL7
	 tPlDM9JyK4SxLr9F51lFtc+Lim+VqxXtSjbH4IGVgV11wFgk2upKKWfFfci3cftK7w
	 J2hFCQe7/Mde+am69UAhfsnZUgaWt6+DToMF6nVob17QSYTcddWjq0gRPxx4GJcxwj
	 xxSi/B4PptCKJS323p1tkUZ/aoAHhSPM/fSdFGh5NJjQhhqVFypEH3eWkfb8LdJbSc
	 udIjrja6pLmOVI8uDJM0wliMIGv8sFY65LvIviwgoUeaF5konSHO0MT7o1cTKafay5
	 ydaUfA4EfqYzQ==
Message-ID: <b5f4a1e5-1561-4554-8de4-0416bca0c75f@kernel.org>
Date: Thu, 18 Sep 2025 14:27:10 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Add sync across amd sfh work functions
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, jikos@kernel.org,
 bentiss@kernel.org, linux-input@vger.kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 Prakruthi SP <Prakruthi.SP@amd.com>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>
References: <20250918123202.1076393-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20250918123202.1076393-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/2025 7:32 AM, Basavaraj Natikar wrote:
> The process of the report is delegated across different work functions.
> Hence, add a sync mechanism to protect SFH work data across functions.
> 
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Closes: https://lore.kernel.org/all/a21abca5-4268-449d-95f1-bdd7a25894a5@linux.dev/
> Tested-by: Prakruthi SP <Prakruthi.SP@amd.com>
> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_client.c | 12 ++++++++++--
>   drivers/hid/amd-sfh-hid/amd_sfh_common.h |  3 +++
>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  4 ++++
>   3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> index 0f2cbae39b2b..7017bfa59093 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> @@ -39,8 +39,12 @@ int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type)
>   	struct amdtp_hid_data *hid_data = hid->driver_data;
>   	struct amdtp_cl_data *cli_data = hid_data->cli_data;
>   	struct request_list *req_list = &cli_data->req_list;
> +	struct amd_input_data *in_data = cli_data->in_data;
> +	struct amd_mp2_dev *mp2;
>   	int i;
>   
> +	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
> +	guard(mutex)(&mp2->lock);
>   	for (i = 0; i < cli_data->num_hid_devices; i++) {
>   		if (cli_data->hid_sensor_hubs[i] == hid) {
>   			struct request_list *new = kzalloc(sizeof(*new), GFP_KERNEL);
> @@ -75,6 +79,8 @@ void amd_sfh_work(struct work_struct *work)
>   	u8 report_id, node_type;
>   	u8 report_size = 0;
>   
> +	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
> +	guard(mutex)(&mp2->lock);
>   	req_node = list_last_entry(&req_list->list, struct request_list, list);
>   	list_del(&req_node->list);
>   	current_index = req_node->current_index;
> @@ -83,7 +89,6 @@ void amd_sfh_work(struct work_struct *work)
>   	node_type = req_node->report_type;
>   	kfree(req_node);
>   
> -	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
>   	mp2_ops = mp2->mp2_ops;
>   	if (node_type == HID_FEATURE_REPORT) {
>   		report_size = mp2_ops->get_feat_rep(sensor_index, report_id,
> @@ -107,6 +112,8 @@ void amd_sfh_work(struct work_struct *work)
>   	cli_data->cur_hid_dev = current_index;
>   	cli_data->sensor_requested_cnt[current_index] = 0;
>   	amdtp_hid_wakeup(cli_data->hid_sensor_hubs[current_index]);
> +	if (!list_empty(&req_list->list))
> +		schedule_delayed_work(&cli_data->work, 0);
>   }
>   
>   void amd_sfh_work_buffer(struct work_struct *work)
> @@ -117,9 +124,10 @@ void amd_sfh_work_buffer(struct work_struct *work)
>   	u8 report_size;
>   	int i;
>   
> +	mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
> +	guard(mutex)(&mp2->lock);
>   	for (i = 0; i < cli_data->num_hid_devices; i++) {
>   		if (cli_data->sensor_sts[i] == SENSOR_ENABLED) {
> -			mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
>   			report_size = mp2->mp2_ops->get_in_rep(i, cli_data->sensor_idx[i],
>   							       cli_data->report_id[i], in_data);
>   			hid_input_report(cli_data->hid_sensor_hubs[i], HID_INPUT_REPORT,
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index f44a3bb2fbd4..78f830c133e5 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -10,6 +10,7 @@
>   #ifndef AMD_SFH_COMMON_H
>   #define AMD_SFH_COMMON_H
>   
> +#include <linux/mutex.h>
>   #include <linux/pci.h>
>   #include "amd_sfh_hid.h"
>   
> @@ -59,6 +60,8 @@ struct amd_mp2_dev {
>   	u32 mp2_acs;
>   	struct sfh_dev_status dev_en;
>   	struct work_struct work;
> +	/* mp2 to protect data */
> +	struct mutex lock;
>   	u8 init_done;
>   	u8 rver;
>   };
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 2983af969579..1d9f955573aa 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -466,6 +466,10 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>   	if (!privdata->cl_data)
>   		return -ENOMEM;
>   
> +	rc = devm_mutex_init(&pdev->dev, &privdata->lock);
> +	if (rc)
> +		return rc;
> +
>   	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
>   	if (privdata->sfh1_1_ops) {
>   		if (boot_cpu_data.x86 >= 0x1A)


