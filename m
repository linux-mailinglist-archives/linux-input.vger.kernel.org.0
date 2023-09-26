Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4577AF188
	for <lists+linux-input@lfdr.de>; Tue, 26 Sep 2023 19:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjIZRF1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Sep 2023 13:05:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjIZRF1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Sep 2023 13:05:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F97CE;
        Tue, 26 Sep 2023 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695747919; x=1727283919;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zS9zzYmwQd8a7LWk1m55vC+iHX7l8dQUqj4piXK6ECg=;
  b=fkMvUYbUbNrUjVvZvTgfzP+E0YtxpJhu2Vi8YhcpNl+pEXN1HaPV6is3
   YQOBTndo3eOklt4I9Nv0inKsqt9sohEXHDZrbZpywWFjVGOJpFO4Y3rxt
   2IhJ8RyxkDpOa9sRjOoJ+rPEdgbaqvjh1a/bHFQd3PzhDkB4H+mSLNZ6S
   NISNAGnS149MNMI8zheJyXeTgMWsJV+Kk8FZwRgevEb/XcjXqpqU5yXNY
   quxtHwYbu6Gsg8/SO/LM2msCtXbWdxB/QG1BKq1AQRnGZTHVIMCthEkHw
   OjKsLgShfMORAhRfFlbmtnWazLdYbBFU6ewpCzTiAkPROsDeCZtEWMVo7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445749329"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="445749329"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814547179"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="814547179"
Received: from hhalmen-mobl.ger.corp.intel.com ([10.251.219.207])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:05:12 -0700
Date:   Tue, 26 Sep 2023 20:05:11 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 04/15] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
In-Reply-To: <20230922175056.244940-5-Shyam-sundar.S-k@amd.com>
Message-ID: <8b3badb4-8c7d-879-eed1-2d9f9e5b99b1@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com> <20230922175056.244940-5-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> PMF Policy binary is a encrypted and signed binary that will be part
> of the BIOS. PMF driver via the ACPI interface checks the existence
> of Smart PC bit. If the advertised bit is found, PMF driver walks
> the acpi namespace to find out the policy binary size and the address
> which has to be passed to the TA during the TA init sequence.
> 
> The policy binary is comprised of inputs (or the events) and outputs
> (or the actions). With the PMF ecosystem, OEMs generate the policy
> binary (or could be multiple binaries) that contains a supported set
> of inputs and outputs which could be specifically carved out for each
> usage segment (or for each user also) that could influence the system
> behavior either by enriching the user experience or/and boost/throttle
> power limits.
> 
> Once the TA init command succeeds, the PMF driver sends the changing
> events in the current environment to the TA for a constant sampling
> frequency time (the event here could be a lid close or open) and
> if the policy binary has corresponding action built within it, the
> TA sends the action for it in the subsequent enact command.
> 
> If the inputs sent to the TA has no output defined in the policy
> binary generated by OEMs, there will be no action to be performed
> by the PMF driver.
> 
> Example policies:
> 
> 1) if slider is performance ; set the SPL to 40W
> Here PMF driver registers with the platform profile interface and
> when the slider position is changed, PMF driver lets the TA know
> about this. TA sends back an action to update the Sustained
> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
> 
> 2) if user_away ; then lock the system
> Here PMF driver hooks to the AMD SFH driver to know the user presence
> and send the inputs to TA and if the condition is met, the TA sends
> the action of locking the system. PMF driver generates a uevent and
> based on the udev rule in the userland the system gets locked with
> systemctl.
> 
> The intent here is to provide the OEM's to make a policy to lock the
> system when the user is away ; but the userland can make a choice to
> ignore it.
> 
> and so on.
> 
> The OEMs will have an utility to create numerous such policies and
> the policies shall be reviewed by AMD before signing and encrypting
> them. Policies are shared between operating systems to have seemless user
> experience.
> 
> Since all this action has to happen via the "amdtee" driver, currently
> there is no caller for it in the kernel which can load the amdtee driver.
> Without amdtee driver loading onto the system the "tee" calls shall fail
> from the PMF driver. Hence an explicit "request_module" has been added
> to address this.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Kconfig  |   1 +
>  drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
>  drivers/platform/x86/amd/pmf/core.c   |  12 +++
>  drivers/platform/x86/amd/pmf/pmf.h    | 132 ++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 141 +++++++++++++++++++++++++-
>  5 files changed, 321 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 3064bc8ea167..437b78c6d1c5 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -9,6 +9,7 @@ config AMD_PMF
>  	depends on POWER_SUPPLY
>  	depends on AMD_NB
>  	select ACPI_PLATFORM_PROFILE
> +	depends on AMDTEE
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3fc5e4547d9f..d0512af2cd42 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>  	return 0;
>  }
>  
> +static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_ADDRESS64:
> +		dev->policy_addr = res->data.address64.address.minimum;
> +		dev->policy_sz = res->data.address64.address.address_length;
> +		break;
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		dev->policy_addr = res->data.fixed_memory32.address;
> +		dev->policy_sz = res->data.fixed_memory32.address_length;
> +		break;
> +	}
> +
> +	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
> +		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> +		return AE_ERROR;
> +	}
> +
> +	return AE_OK;
> +}
> +
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +	acpi_status status;
> +
> +	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(pmf_dev->dev, "acpi_walk_resources failed\n");
> +		return status;
> +	}
> +
> +	return 0;
> +}
> +
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 5fb03ed614ff..6f36c43e081e 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -376,6 +376,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	dev->dev = &pdev->dev;
> +	err = apmf_check_smart_pc(dev);
> +	if (!err) {
> +		/* in order for Smart PC solution to work it has a hard dependency
> +		 * on the amdtee driver to be loaded first even before the PMF driver
> +		 * loads. PMF ASL has a _CRS method that advertises the existence
> +		 * of Smart PC bit. If this information is present, use this to
> +		 * explicitly probe the amdtee driver, so that "tee" plumbing is done
> +		 * before the PMF Smart PC init happens.
> +		 */
> +		if (request_module("amdtee"))
> +			pr_err("Failed to load amdtee. PMF Smart PC not enabled!\n");
> +	}
>  
>  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>  	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index ea15ce547d24..81acf2a37366 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -13,6 +13,8 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/platform_profile.h>
> +#define POLICY_BUF_MAX_SZ		0x4b000
> +#define POLICY_SIGN_COOKIE		0x31535024
>  
>  /* APMF Functions */
>  #define APMF_FUNC_VERIFY_INTERFACE			0
> @@ -59,8 +61,20 @@
>  #define ARG_NONE 0
>  #define AVG_SAMPLE_SIZE 3
>  
> +/* Policy Actions */
> +#define PMF_POLICY_SPL						2
> +#define PMF_POLICY_SPPT						3
> +#define PMF_POLICY_FPPT						4
> +#define PMF_POLICY_SPPT_APU_ONLY				5
> +#define PMF_POLICY_STT_MIN					6
> +#define PMF_POLICY_STT_SKINTEMP_APU				7
> +#define PMF_POLICY_STT_SKINTEMP_HS2				8
> +
>  /* TA macros */
>  #define PMF_TA_IF_VERSION__MAJOR				1
> +#define TA_PMF_ACTION_MAX					32
> +#define TA_PMF_UNDO_MAX						8
> +#define MAX_OPERATION_PARAMS					4
>  
>  /* AMD PMF BIOS interfaces */
>  struct apmf_verify_interface {
> @@ -183,11 +197,16 @@ struct amd_pmf_dev {
>  	bool cnqf_supported;
>  	struct notifier_block pwr_src_notifier;
>  	/* Smart PC solution builder */
> +	unsigned char *policy_buf;
> +	u32 policy_sz;
>  	struct tee_context *tee_ctx;
>  	struct tee_shm *fw_shm_pool;
>  	u32 session_id;
>  	void *shbuf;
>  	struct delayed_work pb_work;
> +	struct pmf_action_table *prev_data;
> +	u64 policy_addr;
> +	void *policy_base;
>  	bool smart_pc_enabled;
>  };
>  
> @@ -399,17 +418,129 @@ struct apmf_dyn_slider_output {
>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>  } __packed;
>  
> +/* Smart PC - TA internals */
> +enum ta_slider {
> +	TA_BEST_BATTERY, /* Best Battery */
> +	TA_BETTER_BATTERY, /* Better Battery */
> +	TA_BETTER_PERFORMANCE, /* Better Performance */
> +	TA_BEST_PERFORMANCE, /* Best Performance */
> +	TA_MAX,
> +};
> +
>  /* cmd ids for TA communication */
>  enum ta_pmf_command {
>  	TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE,
>  	TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES
>  };
>  
> +enum ta_pmf_error_type {
> +	TA_PMF_TYPE__SUCCESS,
> +	TA_PMF_ERROR_TYPE__GENERIC,
> +	TA_PMF_ERROR_TYPE__CRYPTO,
> +	TA_PMF_ERROR_TYPE__CRYPTO_VALIDATE,
> +	TA_PMF_ERROR_TYPE__CRYPTO_VERIFY_OEM,
> +	TA_PMF_ERROR_TYPE__POLICY_BUILDER,
> +	TA_PMF_ERROR_TYPE__PB_CONVERT,
> +	TA_PMF_ERROR_TYPE__PB_SETUP,
> +	TA_PMF_ERROR_TYPE__PB_ENACT,
> +	TA_PMF_ERROR_TYPE__ASD_GET_DEVICE_INFO,
> +	TA_PMF_ERROR_TYPE__ASD_GET_DEVICE_PCIE_INFO,
> +	TA_PMF_ERROR_TYPE__SYS_DRV_FW_VALIDATION,
> +	TA_PMF_ERROR_TYPE__MAX,
> +};
> +
> +struct pmf_action_table {
> +	unsigned long spl; /* in mW */
> +	unsigned long sppt; /* in mW */
> +	unsigned long sppt_apuonly; /* in mW */
> +	unsigned long fppt; /* in mW */
> +	unsigned long stt_minlimit; /* in mW */
> +	unsigned long stt_skintemp_apu; /* in C */
> +	unsigned long stt_skintemp_hs2; /* in C */
> +};
> +
> +/* Input conditions */
> +struct ta_pmf_condition_info {
> +	u32 power_source;
> +	u32 bat_percentage;
> +	u32 power_slider;
> +	u32 lid_state;
> +	bool user_present;
> +	u32 rsvd1[2];
> +	u32 monitor_count;
> +	u32 rsvd2[2];
> +	u32 bat_design;
> +	u32 full_charge_capacity;
> +	int drain_rate;
> +	bool user_engaged;
> +	u32 device_state;
> +	u32 socket_power;
> +	u32 skin_temperature;
> +	u32 rsvd3[5];
> +	u32 ambient_light;
> +	u32 length;
> +	u32 avg_c0residency;
> +	u32 max_c0residency;
> +	u32 s0i3_entry;
> +	u32 gfx_busy;
> +	u32 rsvd4[7];
> +	bool camera_state;
> +	u32 workload_type;
> +	u32 display_type;
> +	u32 display_state;
> +	u32 rsvd5[150];
> +};
> +
> +struct ta_pmf_load_policy_table {
> +	u32 table_size;
> +	u8 table[POLICY_BUF_MAX_SZ];
> +};
> +
> +/* TA initialization params */
> +struct ta_pmf_init_table {
> +	u32 frequency; /* SMU sampling frequency */
> +	bool validate;
> +	bool sku_check;
> +	bool metadata_macrocheck;
> +	struct ta_pmf_load_policy_table policies_table;
> +};
> +
> +/* Everything the TA needs to Enact Policies */
> +struct ta_pmf_enact_table {
> +	struct ta_pmf_condition_info ev_info;
> +	u32 name;
> +};
> +
> +struct ta_pmf_action {
> +	u32 action_index;
> +	u32 value;
> +};
> +
> +/* output actions from TA */
> +struct ta_pmf_enact_result {
> +	u32 actions_count;
> +	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
> +	u32 undo_count;
> +	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
> +};
> +
> +union ta_pmf_input {
> +	struct ta_pmf_enact_table enact_table;
> +	struct ta_pmf_init_table init_table;
> +};
> +
> +union ta_pmf_output {
> +	struct ta_pmf_enact_result policy_apply_table;
> +	u32 rsvd[906];
> +};
> +
>  struct ta_pmf_shared_memory {
>  	int command_id;
>  	int resp_id;
>  	u32 pmf_result;
>  	u32 if_version;
> +	union ta_pmf_output pmf_output;
> +	union ta_pmf_input pmf_input;
>  };
>  
>  /* Core Layer */
> @@ -460,4 +591,5 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>  /* Smart PC builder Layer*/
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1fce04beacb3..a8b05e746efd 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>  	param[0].u.memref.shm_offs = 0;
>  }
>  
> +static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> +{
> +	u32 val;
> +	int idx;
> +
> +	for (idx = 0; idx < out->actions_count; idx++) {
> +		val = out->actions_list[idx].value;
> +		switch (out->actions_list[idx].action_index) {
> +		case PMF_POLICY_SPL:
> +			if (dev->prev_data->spl != val) {
> +				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPL : %d\n", val);
> +				dev->prev_data->spl = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT:
> +			if (dev->prev_data->sppt != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT : %d\n", val);
> +				dev->prev_data->sppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_FPPT:
> +			if (dev->prev_data->fppt != val) {
> +				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update FPPT : %d\n", val);
> +				dev->prev_data->fppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT_APU_ONLY:
> +			if (dev->prev_data->sppt_apuonly != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT_APU_ONLY : %d\n", val);
> +				dev->prev_data->sppt_apuonly = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_MIN:
> +			if (dev->prev_data->stt_minlimit != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_MIN : %d\n", val);
> +				dev->prev_data->stt_minlimit = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_APU:
> +			if (dev->prev_data->stt_skintemp_apu != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_APU : %d\n", val);
> +				dev->prev_data->stt_skintemp_apu = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_HS2:
> +			if (dev->prev_data->stt_skintemp_hs2 != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2 : %d\n", val);
> +				dev->prev_data->stt_skintemp_hs2 = val;
> +			}
> +			break;
> +		}
> +	}
> +}
> +
>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_result *out = NULL;
>  	struct tee_param param[MAX_TEE_PARAM];
>  	struct tee_ioctl_invoke_arg arg;
>  	int ret = 0;
> @@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	if (!dev->tee_ctx)
>  		return -ENODEV;
>  
> +	memset(dev->shbuf, 0, dev->policy_sz);
>  	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
> +	out = &ta_sm->pmf_output.policy_apply_table;
> +
>  	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
>  	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES;
>  	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
> @@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  		return -EINVAL;
>  	}
>  
> +	if (ta_sm->pmf_result == TA_PMF_TYPE__SUCCESS && out->actions_count) {
> +		dev_dbg(dev->dev, "action count:%d result:%x\n", out->actions_count,
> +			ta_sm->pmf_result);
> +		amd_pmf_apply_policies(dev, out);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
>  	struct tee_param param[MAX_TEE_PARAM];
> +	struct ta_pmf_init_table *in = NULL;
>  	struct tee_ioctl_invoke_arg arg;
>  	int ret = 0;
>  
> @@ -80,10 +158,20 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>  		return -ENODEV;
>  	}
>  
> +	dev_dbg(dev->dev, "Policy Binary size: %d bytes\n", dev->policy_sz);
> +	memset(dev->shbuf, 0, dev->policy_sz);
>  	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
> +	in = &ta_sm->pmf_input.init_table;
> +
>  	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE;
>  	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
> +	in->metadata_macrocheck = false;
> +	in->sku_check = false;
> +	in->validate = true;
> +	in->frequency = pb_actions_ms;
> +	in->policies_table.table_size = dev->policy_sz;
>  
> +	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
>  	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__INITIALIZE, &arg, param);
>  
>  	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> @@ -103,6 +191,47 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
>  	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
>  }
>  
> +static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
> +{
> +	u32 cookie, length;
> +	int res;
> +
> +	cookie = readl(dev->policy_buf + 0x10);
> +	length = readl(dev->policy_buf + 0x14);

Name the offsets with defines please.

> +
> +	if (cookie != POLICY_SIGN_COOKIE || !length)
> +		return -EINVAL;
> +
> +	/* update the actual length */
> +	dev->policy_sz = length + 512;
> +	res = amd_pmf_invoke_cmd_init(dev);
> +	if (res == TA_PMF_TYPE__SUCCESS) {
> +		/* now its safe to announce that smart pc is enabled */
> +		dev->smart_pc_enabled = 1;
> +		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
> +	} else {
> +		dev_err(dev->dev, "%s ta invoke_cmd_init failed err: %x\n", __func__, res);
> +		return res;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> +{
> +	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	if (!dev->policy_buf)
> +		return -ENOMEM;
> +
> +	dev->policy_base = ioremap(dev->policy_addr, dev->policy_sz);
> +	if (!dev->policy_base)
> +		return -ENOMEM;

Memleak?

> +	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +
> +	return amd_pmf_start_policy_engine(dev);
> +}
> +
>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -149,7 +278,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>  		goto out_ctx;
>  	}
>  
> -	size = sizeof(struct ta_pmf_shared_memory);
> +	size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
>  	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
>  	if (IS_ERR(dev->fw_shm_pool)) {
>  		dev_err(dev->dev, "%s: tee_shm_alloc_kernel_buf failed\n", __func__);
> @@ -191,11 +320,19 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		return ret;
>  
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> -	return 0;
> +	amd_pmf_set_dram_addr(dev);
> +	amd_pmf_get_bios_buffer(dev);
> +	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
> +	if (!dev->prev_data)
> +		return -ENOMEM;
> +
> +	return dev->smart_pc_enabled;
>  }
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  {
> +	kfree(dev->prev_data);
> +	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);
>  	amd_pmf_tee_deinit(dev);
>  }
> 

-- 
 i.

