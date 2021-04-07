Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83CD357042
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 17:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353570AbhDGP37 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 11:29:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31961 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353550AbhDGP37 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 11:29:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617809389; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JcwFyeJqWTt/6F4dr1wtb+EluQ2hrjm6hvh0P5VoiD4=;
 b=h2NRvpSsCtj+8YWQ+aMfa9N+fq+79cjIcwXFHHLkGFSd59yOh79qVk1CtDX6xaOQH2FW0bR+
 v3JsevI/W2PKOqpnXYdH1OW7ijm3/nDU6ADjxJKZE/XiaT1RP6oWn1HAptpLokDusiFiPg6u
 vZnaaegldO0IlDBPKeyOnBhd0wA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZDE2NCIsICJsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 606dcfe403cfff3452ce78cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 15:29:40
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC458C43468; Wed,  7 Apr 2021 15:29:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19DDEC43465;
        Wed,  7 Apr 2021 15:29:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 20:59:39 +0530
From:   skakit@codeaurora.org
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] input: pm8941-pwrkey: add support for PMK8350
 PON_HLOS PMIC peripheral
In-Reply-To: <1614922721-1390-2-git-send-email-skakit@codeaurora.org>
References: <1614922721-1390-1-git-send-email-skakit@codeaurora.org>
 <1614922721-1390-2-git-send-email-skakit@codeaurora.org>
Message-ID: <690456c09c433741900643eafad25beb@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Gentle Reminder!

Thanks,
Satya Priya
On 2021-03-05 11:08, satya priya wrote:
> From: David Collins <collinsd@codeaurora.org>
> 
> On Qualcomm Technologies, Inc. PMIC PMK8350, the PON peripheral
> is split into two peripherals: PON_HLOS and PON_PBS.  The
> application processor only has write access to PON_HLOS which
> limits it to only receiving PON interrupts.
> 
> Add support for the PMK8350 PON_HLOS peripheral so that its
> KPDPWR_N and RESIN_N interrupts can be used to detect key
> presses.
> 
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  drivers/input/misc/pm8941-pwrkey.c | 103 
> ++++++++++++++++++++++++++-----------
>  1 file changed, 72 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c
> b/drivers/input/misc/pm8941-pwrkey.c
> index cf81044..2044d187 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
