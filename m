Return-Path: <linux-input+bounces-13735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D0B16F99
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 12:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ADB21881659
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 10:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC9A19E7D0;
	Thu, 31 Jul 2025 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ck/jwSmS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D28F18B47E;
	Thu, 31 Jul 2025 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753957866; cv=none; b=OFv95iFW5PEAoHf/cYEZZq8i06P7MKywOTsCTQcFOcGFhqUfgyFRKB0Jwq9e/TELDq+vfLBXtuO3INfMBHyvyFoJYkRThUBRxD0j+t+aj2mQBoclcPHvhtWugekMqRe3w+xjIEm1pko+iyDBf2neBo2aid2mL5boYWuIVBj+Qi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753957866; c=relaxed/simple;
	bh=cUDELXoF3mFoB8u3ji+saaQ0kHytC2R18VJBDBNpeoE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aas4UwWDr+imY1lx/9rAkPLy1JVZq1v6d3wG5Vl7k/N2FFQnfoL3Dw0OBcfDii5wOmR8Mva9BkUnUC6XErhPTuUHwAR36j03DiKt98jHHzv/D1t6d0GpfMrsB2zZ0zDkeyvegTPQmeHS1GSscpSLjwr6AA3deDPDo1yx8inPaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ck/jwSmS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753957861; x=1785493861;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cUDELXoF3mFoB8u3ji+saaQ0kHytC2R18VJBDBNpeoE=;
  b=Ck/jwSmSXnpmHa8aw41Jm2SxdT9rOc4id9m3EX6fQGEieqdWW54GZiGB
   scZm6/Xy0G9DvgZZr46S7MIGHVeiXSJTdf1Y5q0GnC+auN4U6aIgqhucU
   hv6bXipqEdFjDQrX0ulba8GM2Hlh1JxYhAzR0cQ4/NZrPsXXsDbOcRBJ9
   n8yXep1nsWPOc5MEOqGBxGwgVIbPJavLspgT7iPjLgPVcJIy3qd2B8Dje
   tADoOaemBd+RLMeatXuq7py9N066HJUE/KzhTKypGi2WfUEOpW1wd4h49
   XzRbvR4pbOfATexD55se0mZGwSIQmoKhKZV6Adp/dBed9zMs876zJ5Cdf
   Q==;
X-CSE-ConnectionGUID: ZDqz3cLHT6i7KBUqFwME0Q==
X-CSE-MsgGUID: uqp98xS8SFCHRuUdNAiyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60098202"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="60098202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 03:31:00 -0700
X-CSE-ConnectionGUID: fMAgt8bNR7i8o5nkyRZBDQ==
X-CSE-MsgGUID: FssnAyh0R32oWsGHQT+/mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="162501067"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 03:30:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pin-Yen Lin <treapking@chromium.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Chen-Yu
 Tsai <wenst@chromium.org>, Pin-Yen Lin <treapking@google.com>
Subject: Re: [PATCH 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
In-Reply-To: <20250731101344.2761757-1-treapking@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250731101344.2761757-1-treapking@google.com>
Date: Thu, 31 Jul 2025 13:30:52 +0300
Message-ID: <1519a7c3872a59b7b5f12e99529237035499bc26@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 31 Jul 2025, Pin-Yen Lin <treapking@chromium.org> wrote:
> Some touch controllers have to be powered on after the panel's backlight
> is enabled. To support these controllers, introduce after_panel_enabled
> flag to the panel follower and power on the device after the panel and
> its backlight are enabled.

I think it's *very* confusing and error prone to call follower hooks at
different places depending on a flag. The hook names and documentation
say *when* they get called, and that should not change.

I think the right approach would be to add .panel_enabled and
.panel_disabling hooks to struct drm_panel_follower_funcs, and have them
called after panel (and backlight) have been enabled and before panel
(and backlight) are disabled, respectively.

In i2c-hid-core.c, you'd then have two copies of struct
drm_panel_follower_funcs, and use one or the other depending on the
quirk. You can even reuse the functions.

I think overall it'll be be more consistent, more flexible, and probably
fewer lines of code too.


BR,
Jani.

> Signed-off-by: Pin-Yen Lin <treapking@google.com>

PS. Your Signed-off-by doesn't match the patch author.

> ---
>
>  drivers/gpu/drm/drm_panel.c | 47 +++++++++++++++++++++++++++++++++----
>  include/drm/drm_panel.h     |  8 +++++++
>  2 files changed, 51 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 650de4da08537..58125f8418f37 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -133,6 +133,9 @@ void drm_panel_prepare(struct drm_panel *panel)
>  	panel->prepared = true;
>  
>  	list_for_each_entry(follower, &panel->followers, list) {
> +		if (follower->after_panel_enabled)
> +			continue;
> +
>  		ret = follower->funcs->panel_prepared(follower);
>  		if (ret < 0)
>  			dev_info(panel->dev, "%ps failed: %d\n",
> @@ -178,6 +181,9 @@ void drm_panel_unprepare(struct drm_panel *panel)
>  	mutex_lock(&panel->follower_lock);
>  
>  	list_for_each_entry(follower, &panel->followers, list) {
> +		if (follower->after_panel_enabled)
> +			continue;
> +
>  		ret = follower->funcs->panel_unpreparing(follower);
>  		if (ret < 0)
>  			dev_info(panel->dev, "%ps failed: %d\n",
> @@ -208,6 +214,7 @@ EXPORT_SYMBOL(drm_panel_unprepare);
>   */
>  void drm_panel_enable(struct drm_panel *panel)
>  {
> +	struct drm_panel_follower *follower;
>  	int ret;
>  
>  	if (!panel)
> @@ -218,10 +225,12 @@ void drm_panel_enable(struct drm_panel *panel)
>  		return;
>  	}
>  
> +	mutex_lock(&panel->follower_lock);
> +
>  	if (panel->funcs && panel->funcs->enable) {
>  		ret = panel->funcs->enable(panel);
>  		if (ret < 0)
> -			return;
> +			goto exit;
>  	}
>  	panel->enabled = true;
>  
> @@ -229,6 +238,18 @@ void drm_panel_enable(struct drm_panel *panel)
>  	if (ret < 0)
>  		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
>  			     ret);
> +
> +	list_for_each_entry(follower, &panel->followers, list) {
> +		if (!follower->after_panel_enabled)
> +			continue;
> +
> +		ret = follower->funcs->panel_prepared(follower);
> +		if (ret < 0)
> +			dev_info(panel->dev, "%ps failed: %d\n",
> +				 follower->funcs->panel_prepared, ret);
> +	}
> +exit:
> +	mutex_unlock(&panel->follower_lock);
>  }
>  EXPORT_SYMBOL(drm_panel_enable);
>  
> @@ -242,6 +263,7 @@ EXPORT_SYMBOL(drm_panel_enable);
>   */
>  void drm_panel_disable(struct drm_panel *panel)
>  {
> +	struct drm_panel_follower *follower;
>  	int ret;
>  
>  	if (!panel)
> @@ -261,6 +283,18 @@ void drm_panel_disable(struct drm_panel *panel)
>  		return;
>  	}
>  
> +	mutex_lock(&panel->follower_lock);
> +
> +	list_for_each_entry(follower, &panel->followers, list) {
> +		if (!follower->after_panel_enabled)
> +			continue;
> +
> +		ret = follower->funcs->panel_unpreparing(follower);
> +		if (ret < 0)
> +			dev_info(panel->dev, "%ps failed: %d\n",
> +				 follower->funcs->panel_unpreparing, ret);
> +	}
> +
>  	ret = backlight_disable(panel->backlight);
>  	if (ret < 0)
>  		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
> @@ -269,9 +303,12 @@ void drm_panel_disable(struct drm_panel *panel)
>  	if (panel->funcs && panel->funcs->disable) {
>  		ret = panel->funcs->disable(panel);
>  		if (ret < 0)
> -			return;
> +			goto exit;
>  	}
>  	panel->enabled = false;
> +
> +exit:
> +	mutex_unlock(&panel->follower_lock);
>  }
>  EXPORT_SYMBOL(drm_panel_disable);
>  
> @@ -537,7 +574,8 @@ int drm_panel_add_follower(struct device *follower_dev,
>  	mutex_lock(&panel->follower_lock);
>  
>  	list_add_tail(&follower->list, &panel->followers);
> -	if (panel->prepared) {
> +	if ((panel->prepared && !follower->after_panel_enabled) ||
> +	    (panel->enabled && follower->after_panel_enabled)) {
>  		ret = follower->funcs->panel_prepared(follower);
>  		if (ret < 0)
>  			dev_info(panel->dev, "%ps failed: %d\n",
> @@ -566,7 +604,8 @@ void drm_panel_remove_follower(struct drm_panel_follower *follower)
>  
>  	mutex_lock(&panel->follower_lock);
>  
> -	if (panel->prepared) {
> +	if ((panel->prepared && !follower->after_panel_enabled) ||
> +	    (panel->enabled && follower->after_panel_enabled)) {
>  		ret = follower->funcs->panel_unpreparing(follower);
>  		if (ret < 0)
>  			dev_info(panel->dev, "%ps failed: %d\n",
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 843fb756a2950..aa9b6218702fd 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -183,6 +183,14 @@ struct drm_panel_follower {
>  	 * The panel we're dependent on; set by drm_panel_add_follower().
>  	 */
>  	struct drm_panel *panel;
> +
> +	/**
> +	 * @after_panel_enabled
> +	 *
> +	 * If true then this panel follower should be powered after the panel
> +	 * and the backlight are enabled, instead of after panel is prepared.
> +	 */
> +	bool after_panel_enabled;
>  };
>  
>  /**

-- 
Jani Nikula, Intel

