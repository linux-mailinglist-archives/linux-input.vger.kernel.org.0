Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E820C3D411D
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 21:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhGWTJg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 15:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGWTJg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 15:09:36 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCE3C061575;
        Fri, 23 Jul 2021 12:50:08 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id l19so3825039pjz.0;
        Fri, 23 Jul 2021 12:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bDiI3EO8AzrNDXr54L1zRo1hNqxxhRPdVp1iiTrZHuE=;
        b=O87tWbGM4+scWBCHaw54s6h8sT36bjOeQ1d3zMAVvsklV8a9SrA/2S4J1rGGUUOtHi
         wb4v0J7rvky1UHLit++w309jdKBmuX7qVaPNDokqjRcioYGrqtjN3taSveu6Q0W0C84a
         VtpcMMbx3AKWNOySvEEO1zNt9NMhGHB7eX7+NrnQnlwxZvBxCp/PK+UNLbGpiV1bPGlr
         +tWk25bU5VGRzx29gfwF/VEtvuxBWkMiNEeFI1Ek68YKiUqU7eHo1Otu4t2+06yuyZ1b
         EON9RB4rvhbNJhElHaeNfk3xjPZamFoNUHLNt5S6fmR6GIl8d3oJWpxnTYiDWYq+ijnQ
         Mv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bDiI3EO8AzrNDXr54L1zRo1hNqxxhRPdVp1iiTrZHuE=;
        b=UK/CIzfdfpOSU72K1pcjXXXZpyfYVdfec8JSOT4selR+1OMKpQsyrdmGRlM0fA5Tip
         CTnP3yoEcUra3wMlbnEh/JfZe183xhmSPaBjG5dhsS/saTYftDtJgJQp9gU+TEFUNLSZ
         8q8+Tm3J4Vm43JksX0xwRJd6YYQlr7ytywx76SUxJDQBMlfvJ1hQRLlE4l4U/ZQMVRBU
         rEnlEE1++WgVQUsZNb11+HNoJddnS0s2+kdTtGkadF5bFg4CEhkjxGXn0PmoDyClKhN5
         zAr7EEpbqRu1enGcjcT82qqoGHlsfP9/vcvRQAQB6rrMnJ24RU9LA7k6w4Vbc3kK2P1Z
         /K9A==
X-Gm-Message-State: AOAM531yWK0o1HBKcA24N+7M8WdBeXIyMfRTs4oB4atscZZAmY7DyXjQ
        Fz6BUo0DEx4M2/po0/Ec5us=
X-Google-Smtp-Source: ABdhPJxziLompPG4xPZ2LgUc9aDP2z4ijwhATbDnYLd0g3KvVyd4MYVgkMP/KJHLfOVKnvmnbs8a4g==
X-Received: by 2002:a05:6a00:1693:b029:333:da3a:8c86 with SMTP id k19-20020a056a001693b0290333da3a8c86mr6239520pfc.41.1627069807766;
        Fri, 23 Jul 2021 12:50:07 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:55b1:90d5:6a79:755f])
        by smtp.gmail.com with ESMTPSA id w145sm24225659pfc.39.2021.07.23.12.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 12:50:06 -0700 (PDT)
Date:   Fri, 23 Jul 2021 12:50:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        luca_hsu@ilitek.com
Subject: Re: [PATCH] Input: ilitek_ts_i2c - support firmware update
Message-ID: <YPsdbKgG5nOBqUei@google.com>
References: <20210511140506.378070-1-joe_hung@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511140506.378070-1-joe_hung@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Tue, May 11, 2021 at 10:05:06PM +0800, Joe Hung wrote:
> +static int ilitek_parse_hex(struct ilitek_ts_data *ts, u32 *fw_size, u8 *fw_buf)
> +{
> +	int error;
> +	char *fw_file;
> +	const struct firmware *fw;
> +	struct device *dev = &ts->client->dev;
> +	u32 i, len, addr, type, exaddr = 0;
> +	u8 info[4], data[16];
> +
> +	fw_file = kasprintf(GFP_KERNEL, "ilitek_%04x.hex", ts->mcu_ver);
> +	if (!fw_file)
> +		return -ENOMEM;
> +
> +	error = request_firmware(&fw, fw_file, dev);
> +	kfree(fw_file);
> +	if (error) {
> +		dev_err(dev, "request firmware:%s failed, ret:%d\n",
> +			fw_file, error);
> +		return error;
> +	}
> +
> +	for (i = 0; i < fw->size; i++) {
> +		if (fw->data[i] == ':' ||
> +		    fw->data[i] == 0x0D ||
> +		    fw->data[i] == 0x0A)
> +			continue;
> +
> +		error = hex2bin(info, fw->data + i, sizeof(info));
> +		if (error)
> +			goto release_fw;
> +
> +		len = info[0];
> +		addr = get_unaligned_be16(info + 1);
> +		type = info[3];
> +
> +		error = hex2bin(data, fw->data + i + 8, len);
> +		if (error)
> +			goto release_fw;
> +
> +		switch (type) {
> +		case 0x01:
> +			goto release_fw;
> +		case 0x02:
> +			exaddr = get_unaligned_be16(data);
> +			exaddr <<= 4;
> +			break;
> +		case 0x04:
> +			exaddr = get_unaligned_be16(data);
> +			exaddr <<= 16;
> +			break;
> +		case 0xAC:
> +		case 0xAD:
> +			break;
> +		case 0x00:
> +			addr += exaddr;
> +			memcpy(fw_buf + addr, data, len);
> +			*fw_size = addr + len;
> +			break;
> +		default:
> +			dev_err(dev, "unexpected type:%x in hex\n", type);
> +			goto err_invalid;
> +		}

This looks like ihex. Is it? If so we have request_ihex_firmware() and
ihex2fw tool to convertihex firmware to compact binary format. Please
use it.

Thanks.

-- 
Dmitry
