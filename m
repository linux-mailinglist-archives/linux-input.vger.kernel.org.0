Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8187B2C2046
	for <lists+linux-input@lfdr.de>; Tue, 24 Nov 2020 09:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgKXInI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Nov 2020 03:43:08 -0500
Received: from www381.your-server.de ([78.46.137.84]:49786 "EHLO
        www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730492AbgKXInI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Nov 2020 03:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=/PJriEbKuBtu1s7B9RLwhifyLDJjChCYoTRFC2wpWEk=; b=dPPeGkRu/MoW93ThXxCexkdM7u
        V2HaUjTWlQOybg5914q/yQUVMEyajjunPzo8ybmJNYwwy27pqXXOPyE8z3gCRcTE0b9W7KUUsqujT
        4rir8R38Id+LCFqgf2xaAJfpCs4buoh4OimyTSZHdgyg6nXWbdiyDSnSuAZEpzntZGGF3rhkCPg95
        5zC2H+Rq8pxyFh5pxyvu4OfESypJxNmzZMHFbubOBv0RdGGjvsY1kFWYC8PJQFLyLmQlASEIi17Bj
        jrJXXcXKCe/BH4pk3pH5RYNAaUxAIbdvs0fIVRlRQOg/gpggMnQLRXNU517uL1PQ9FDTF+iPTNI0O
        Jcn1QXVQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1khTuj-0005Go-Tn; Tue, 24 Nov 2020 09:43:06 +0100
Received: from [62.216.202.98] (helo=[192.168.178.20])
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1khTuj-000PIe-Q1; Tue, 24 Nov 2020 09:43:05 +0100
Subject: Re: [PATCH v2 3/3] Input: adp5589-keys - add basic devicetree support
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
References: <20201124082255.13427-1-alexandru.ardelean@analog.com>
 <20201124082255.13427-3-alexandru.ardelean@analog.com>
From:   Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <d8265d12-0269-a7ed-1f02-ee5679ee1db2@metafoo.de>
Date:   Tue, 24 Nov 2020 09:43:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124082255.13427-3-alexandru.ardelean@analog.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/25997/Mon Nov 23 14:13:38 2020)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/24/20 9:22 AM, Alexandru Ardelean wrote:
>   	error = devm_add_action_or_reset(&client->dev, adp5589_clear_config,
> @@ -1078,6 +1098,13 @@ static int __maybe_unused adp5589_resume(struct device *dev)
>   
>   static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
>   
> +static const struct of_device_id adp5589_of_match[] = {
> +	{ .compatible = "adi,adp5585", .data = &adp5589_chip_info_tbl[ADP5585_01] },
> +	{ .compatible = "adi,adp5585-02", .data = &adp5589_chip_info_tbl[ADP5585_02] },
> +	{ .compatible = "adi,adp5589", .data = &adp5589_chip_info_tbl[ADP5589] },

I think we need to add these to 
Documentation/devicetree/bindings/trivial-devices.yaml


