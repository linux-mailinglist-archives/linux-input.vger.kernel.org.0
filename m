Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DDD39B83C
	for <lists+linux-input@lfdr.de>; Fri,  4 Jun 2021 13:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhFDLrr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Jun 2021 07:47:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13266 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230112AbhFDLrr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Jun 2021 07:47:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622807161; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/fL5ftPhjRgVOQgMkNWuk43t7ra9Y4TLDX3/oQqRB+M=;
 b=XfYS9nIVH0nblREWgIS4MDE6mpI36T23ttWv7o9GagQw6gBHxdWEoXGvAL0fkPrdWv69GXih
 rnDWr+kkW/tnOsUUO3NG7aiizamiZtvS8ewv5sVBD0JLP+Oxx4Ce4AuBx9eHp2CSkIzO7v3+
 uy2ykXxCKSgiGWoCRobw8bGyBn4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZDE2NCIsICJsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60ba124ee27c0cc77f155f42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Jun 2021 11:45:18
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15AEAC43460; Fri,  4 Jun 2021 11:45:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52880C433F1;
        Fri,  4 Jun 2021 11:45:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 04 Jun 2021 17:15:17 +0530
From:   skakit@codeaurora.org
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        kgunda@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V3 5/5] dt-bindings: power: reset: qcom-pon: Convert qcom
 PON binding to yaml
In-Reply-To: <0e1471d4522d1356e354c4653e8e0b42@codeaurora.org>
References: <1620630064-16354-1-git-send-email-skakit@codeaurora.org>
 <1620630064-16354-6-git-send-email-skakit@codeaurora.org>
 <20210510162506.GA234174@robh.at.kernel.org>
 <20210604110917.zbrjzpl23ujqclyf@earth.universe>
 <0e1471d4522d1356e354c4653e8e0b42@codeaurora.org>
Message-ID: <f3ea0212f4122099e0e35d1aaf5e9e07@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2021-06-04 17:12, skakit@codeaurora.org wrote:
> Hi,
> 
> On 2021-06-04 16:39, Sebastian Reichel wrote:
>> Hi,
>> 
>> On Mon, May 10, 2021 at 11:25:06AM -0500, Rob Herring wrote:
>>> On Mon, 10 May 2021 12:31:04 +0530, satya priya wrote:
>>> > Convert qcom PON binding from .txt to .yaml format.
>>> >
>>> > The example has been removed in favour of full example being
>>> > available in the qcom,pm8941-pwrkey binding.
>>> >
>>> > Signed-off-by: satya priya <skakit@codeaurora.org>
>>> > ---
>>> > Changes in V2:
>>> >  - As per Rob's comments, converted the main PON binding and added in V2.
>>> >
>>> > Changes in V3:
>>> >  - As per Sebastian's comments, added allOf to refer reboot-mode.yaml and
>>> >    used unevaluatedProperties = false. Added maxItems for reg.
>>> >
>>> >  .../devicetree/bindings/power/reset/qcom,pon.txt   | 49 ----------------------
>>> >  .../devicetree/bindings/power/reset/qcom,pon.yaml  | 44 +++++++++++++++++++
>>> >  2 files changed, 44 insertions(+), 49 deletions(-)
>>> >  delete mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
>>> >  create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
>>> >
>>> 
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>> 
>> Acked-by: Sebastian Reichel <sre@kernel.org>
>> 
> 
> There is a V4 for this.
> https://lore.kernel.org/patchwork/patch/1425638/
> 
Seems like you already reviewed the V4.

Thanks,
Satya Priya
>> -- Sebastian
