Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F8A3FBF1C
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 00:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhH3Wut (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 18:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238966AbhH3Wus (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 18:50:48 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F358CC061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 15:49:53 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3661C833C8;
        Tue, 31 Aug 2021 00:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630363790;
        bh=KEds9nYENXFOfym+oZFq24QywwGuKxsR2Qj2AAa6TW4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EbUvp870xZYisiUFAc+XcDwXS2tcZbgLbDka7y6hNzPbfB5oqofETm4amC9NwK0lo
         GQfSI0JgvMpvTg04BHVks8Mchc6JCrcdft0F1sg5iuq3o5yeGQhrVjN2hV9VYKqXbc
         E1RRe/oNo4VLiGwdWpEvL0ffDy9U/SiVoFr/xMacnkE+cdqOr7cqkJlSlYfLxjsq6y
         PMwIcPziCpJO0cNiB252jWCn5g8IrKAL7HOKCsteY29cK5xwr6sUp/9LRPiTyLyI5t
         3MhXz4nLFsa22rvi8kVNkWLHtEu8h7sYGLiuzth9Lkjch2jjWOq5gVzDYiUsIMCAIE
         oZYhPASghXfqQ==
Subject: Re: [PATCH v2 1/3] Input: ili210x - use resolution from ili251x
 firmware
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
References: <20210827211258.318618-1-marex@denx.de>
 <YS1FsJROzDkm/0Ky@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <bfc05564-38dd-d950-ed71-0599c48d57f4@denx.de>
Date:   Tue, 31 Aug 2021 00:49:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS1FsJROzDkm/0Ky@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/30/21 10:55 PM, Dmitry Torokhov wrote:

[...]

>> +		return -EINVAL;
>> +
>> +	priv->input->absinfo[ABS_X].maximum = resx - 1;
>> +	priv->input->absinfo[ABS_Y].maximum = resy - 1;
>> +	priv->input->absinfo[ABS_MT_POSITION_X].maximum = resx - 1;
>> +	priv->input->absinfo[ABS_MT_POSITION_Y].maximum = resy - 1;
> 
> There is
> 
> 	input_set_abs_max(priv->input, ABS_X, resx - 1);

git grep finds nothing in linux-next / your tree on k.org / patchwork. 
Where is that ?

[...]
