Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A011FAED5
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 13:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFPLCZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 07:02:25 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54364 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFPLCZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 07:02:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3FC5A1C0C0F; Tue, 16 Jun 2020 13:02:23 +0200 (CEST)
Date:   Tue, 16 Jun 2020 13:02:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Fengping Yu <fengping.yu@mediatek.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/3] drivers: input: misc: Add mtk vibrator driver
Message-ID: <20200616110216.GK1718@bug>
References: <20200615114203.116656-1-fengping.yu@mediatek.com>
 <20200615114203.116656-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615114203.116656-3-fengping.yu@mediatek.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

> +static int mt_vibra_parse_dt(struct device *dev,
> +		struct reg_vibr_config *vibr_conf)
> +{
> +	int ret;
> +
> +	if (device_property_read_u32(dev, "min-limit",
> +				     &vibr_conf->min_limit))
> +		vibr_conf->min_limit = DEFAULT_MIN_LIMIT;
> +	vibr_conf->min_limit = max_t(unsigned int,
> +		vibr_conf->min_limit, DEFAULT_MIN_LIMIT);
> +
> +	if (device_property_read_u32(dev, "max-limit",
> +				     &vibr_conf->max_limit))
> +		vibr_conf->max_limit = 0;

Is max_limit useful? Do you enforce it in useful way?

> +	if (!vibr_conf->max_limit &&
> +		vibr_conf->max_limit < vibr_conf->min_limit) {
> +		dev_err(dev, "error load dts: get error limitation(min > max)\n");
> +		return -EINVAL;
> +	}

Condition looks wrong.

> +static struct attribute *sysfs_attrs[] = { + &dev_attr_activate.attr, + 
> &dev_attr_state.attr, + &dev_attr_duration.attr, + NULL, +}; + +static struct 
> attribute_group vibr_group = { + .attrs = sysfs_attrs, +}; + +static int 
> regulator_oc_event(struct notifier_block *nb, + unsigned long event, void *data) +{ + 

Do you need custom attributes? Why? Where is their documentation?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
