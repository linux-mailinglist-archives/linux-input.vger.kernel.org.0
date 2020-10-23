Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28832296BBE
	for <lists+linux-input@lfdr.de>; Fri, 23 Oct 2020 11:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461034AbgJWJFv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 05:05:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S461024AbgJWJFu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 05:05:50 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4801C24182;
        Fri, 23 Oct 2020 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603443950;
        bh=TQKLdLhdLKw6el7lOB1+SFBPA1fgCoQQr5pswqEOitA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=H4r2kixVq/7XMuy33rBrjOCxmWkXYBywIU30BNMXRQWjyWFucR6Wembertnuyuq35
         sNfvR/YftxllOajVowwm0hZHIu5BOGSMDE6TDcB70nwuhE8Fc68MzvUCY/lJ03FIMn
         7EBgGaeHDeSVKog7WBrh4eu+sz1ZeQqo3Y+z3p8s=
Date:   Fri, 23 Oct 2020 11:05:46 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sandeep Singh <Sandeep.Singh@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, jic23@kernel.org,
        Nehal-bakulchandra.Shah@amd.com, Shyam-sundar.S-k@amd.com,
        lipheng@hanmail.net, Richard Neumann <mail@richard-neumann.de>
Subject: Re: [PATCH] AMD_SFH: Fix for incorrect Sensor index
In-Reply-To: <20201023085947.459045-1-Sandeep.Singh@amd.com>
Message-ID: <nycvar.YFH.7.76.2010231104540.18859@cbobk.fhfr.pm>
References: <20201023085947.459045-1-Sandeep.Singh@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 23 Oct 2020, Sandeep Singh wrote:

> From: Sandeep Singh <sandeep.singh@amd.com>
> 
> Add fix for incorrect sensor index and minor code clean-up.
> 
> Reported-by: Mandoli <lipheng@hanmail.net>

CCing Richard Neumann, I believe he reported exactly the same issue too, 
and thus should be added as Reported-by: too. Agreed?

Thanks.

> Signed-off-by: Sandeep Singh <sandeep.singh@amd.com>
> Fixes: SFH: PCIe driver to add support of AMD sensor fusion hub (4f567b9f8141)
> ---
> This patch can be applied on = for-5.11/amd-sfh-hid
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c             |  6 +++---
>  .../amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h  | 14 --------------
>  2 files changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 9c5eb442e1a6..a51c7b76283b 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -20,9 +20,9 @@
>  #define DRIVER_NAME	"pcie_mp2_amd"
>  #define DRIVER_DESC	"AMD(R) PCIe MP2 Communication Driver"
>  
> -#define ACEL_EN		BIT(1)
> -#define GYRO_EN		BIT(2)
> -#define MAGNO_EN	BIT(3)
> +#define ACEL_EN		BIT(0)
> +#define GYRO_EN		BIT(1)
> +#define MAGNO_EN		BIT(2)
>  #define ALS_EN		BIT(19)
>  
>  void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
> diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
> index ac9a01cc1454..095c471d8fd6 100644
> --- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
> +++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
> @@ -16,11 +16,6 @@ enum desc_type {
>  	feature_size,
>  };
>  
> -struct _hid_report_descriptor {
> -	u8 bDescriptorType;
> -	u8 wDescriptorLength;
> -};
> -
>  struct common_feature_property {
>  	/* common properties */
>  	u8 report_id;
> @@ -38,15 +33,6 @@ struct common_input_property {
>  	u8 event_type;
>  } __packed;
>  
> -struct _hid_device_descriptor {
> -	u8 bLength;
> -	u8 bDescriptorType;
> -	u8 bcdHID[2];
> -	u8 bCountryCode;
> -	u8 bNumDescriptors;
> -	struct _hid_report_descriptor *reports;
> -};
> -
>  struct accel3_feature_report {
>  	struct common_feature_property common_property;
>  	/* properties specific to this sensor */
> -- 
> 2.25.1
> 

-- 
Jiri Kosina
SUSE Labs

