Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8D12EC9F0
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 06:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbhAGFV6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 00:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAGFV6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 00:21:58 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE881C0612F0;
        Wed,  6 Jan 2021 21:21:17 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id t22so3173353pfl.3;
        Wed, 06 Jan 2021 21:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oJwkEv2jlSNP3WrO5Vf9IqJ+fb2RqSaCTtW7Dm7rldA=;
        b=WpMj6Q4evfMCLUvNTeTrFr9kYMzdQGUyGiui/25pxZDIE2feg6U5I4g9keWJxrlGIh
         cU0sJojbj5fTmLoYyoXIZfKFGjjeI6HdpVGCKwI3De6lqtjRrNyWCy79M8oS4ntKJb9k
         Lyr8WRG1jMB0STEpcRTM2ieqthG5LaJlgMRH0nyCPLIlh16DhmJsKP1ZMRmPZC67W1W8
         7yY+2RdVG3ghgd5WDQYTUF58bEjnEHje8aHAoqmIKuXqqSYNCuTqs+k79VxIoTMARk6l
         W6Eo/Bw1/pK1Iern0pcngUjOZRa4K4b9+FXpaRA45D8Ro9DJFWlMAbf6CAtFwuYuqSEX
         /9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oJwkEv2jlSNP3WrO5Vf9IqJ+fb2RqSaCTtW7Dm7rldA=;
        b=Ap0AifhrXoxsXSsaMshSQyOTKvdnhuY9AJANJS1ROFhoXYWcnDdOgPN+MetpXYWWyQ
         8ll2KGoJDanghZZdgUUXflWmGREXQEe8gZTod/65yyMgbFU+MWZh5PN0Nobt0nZN3Rpa
         Pw7c4uqIUb+i/qF8XeRvKfI48oXvoQe6dKQ4Jo/OmZP4+tBcAAHdVSiueET901y5j9Nc
         GgYXbQwr3SSA2TI4l/TrPlcAgpqiexzck6wR0N2NhIohJtIn8FWHHQLCA1g8vltc/oo7
         3ARTqthWBBidLrYeuENEa+qjb4iZ8Rg5Ti8ym0AQPDrD4NpB1ioZQcha72dPkzi5R77y
         oFwg==
X-Gm-Message-State: AOAM530sMIN72KM9YNpZ2VHHJu9ffwePEy9Lv7+zQX//uJ8YJTjtsR3c
        TvcWr0rPE2ZHQPS7Qop6j6o=
X-Google-Smtp-Source: ABdhPJwqPU9pv/3rCFGgmRYIEbUhy2yA94FAMlsLmmH7oyToQI1J5Jd8fUIvUmtsRv2tl5erRIKNWw==
X-Received: by 2002:a62:528c:0:b029:19e:4a39:d9ea with SMTP id g134-20020a62528c0000b029019e4a39d9eamr7503750pfb.20.1609996877074;
        Wed, 06 Jan 2021 21:21:17 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id p17sm3993779pfn.52.2021.01.06.21.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 21:21:16 -0800 (PST)
Date:   Wed, 6 Jan 2021 21:21:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, dianders@chromium.org,
        swboyd@chromium.org, Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Input: cros-ec-keyb - Expose function row
 physical map to userspace
Message-ID: <X/aaSdEATjwStnOo@google.com>
References: <20210104182154.v3.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <20210104182154.v3.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210104182154.v3.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Philip,

On Mon, Jan 04, 2021 at 06:22:34PM -0800, Philip Chen wrote:
> The top-row keys in a keyboard usually have dual functionalities.
> E.g. A function key "F1" is also an action key "Browser back".
> 
> Therefore, when an application receives an action key code from
> a top-row key press, the application needs to know how to correlate
> the action key code with the function key code and do the conversion
> whenever necessary.
> 
> Since the userpace already knows the key scanlines (row/column)
> associated with a received key code. Essentially, the userspace only
> needs a mapping between the key row/column and the matching physical
> location in the top row.
> 
> This patch enhances the cros-ec-keyb driver to create such a mapping
> and expose it to userspace in the form of a function-row-physmap
> attribute. The attribute would be a space separated ordered list of
> row/column codes, for the keys in the function row, in a left-to-right
> order.
> 
> The attribute will only be present when the device has a custom design
> for the top-row keys.
> 
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
> 
> Changes in v3:
> - parse `function-row-physmap` from DT earlier, when we probe
>   cros_ec_keyb, and then store the extracted info in struct cros_ec_keyb.

Thank you for making the changes, much appreciated. Let's wait a bit to
see if Rob has any issues with this.

...

>  static int cros_ec_keyb_probe(struct platform_device *pdev)
>  {
>  	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
> @@ -617,6 +690,12 @@ static int cros_ec_keyb_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	err = sysfs_create_group(&dev->kobj, &cros_ec_keyb_attr_group);
> +	if (err) {
> +		dev_err(dev, "failed to create attributes. err=%d\n", err);
> +		return err;
> +	}

Let's use devm_device_add_group() so that we do not need to remove it
manually in cros_ec_keyb_remove().

Thanks.

-- 
Dmitry
