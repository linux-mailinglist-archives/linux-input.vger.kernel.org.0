Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB74E357C8E
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 08:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhDHGYx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 02:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhDHGYv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 02:24:51 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FD7C061760;
        Wed,  7 Apr 2021 23:24:40 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d8so476083plh.11;
        Wed, 07 Apr 2021 23:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KRB+MP29i6N/LmWGaVeAvxO+5fLRMR6FbJkAYNaIpxs=;
        b=BErOp91cY4J1oxkHp0oTkioGkJfTkXFzkrXSnxV4hbBq/9PpQ6bR7+bodwp2lqUA0z
         peH4PUkdcpxPrzuOsloYjNztsa7C7vlQe+yjkcrDgBx0cgLF8TXtDdOBXD42LFqH0FGz
         7cACSrIS0+Xg2Vr6syAsqZm/gdMlYhVWAIWzvlbuitReWSNWhkVG4VVmJ3rCmss2rcik
         2TKLY9J2cw9LEXtFmw/7QbBra6/jNuQkwGKYIXgmCudmzGmmfb+5WK2640YOZrjvCrVa
         ozXZFEl5twUJZF9pX6sCgCsd+SsBfbi+Hfc6taKr+mQlRCOnUFl5ddJT2YdRyQcR/Zmo
         Rvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KRB+MP29i6N/LmWGaVeAvxO+5fLRMR6FbJkAYNaIpxs=;
        b=KJDu0yb8YYgnFN8YbMFd0Y3b5ELcN2zuiR2Sd4xwl1TuXZp9kJqi1gPbwnz8+QwDnN
         31lxJoTz8U+2TmI5vyhqERHRMPE0y3Ppp00xZUKEg0FWtEUWtKZhkXqx/BvQ/pKfFDte
         9ult/IYfXZtqRSaK0hcyyG4hZtFDr+TTc8zwUy+rfoyAk/FiaI4RWQLk4hnpDzDr/l1V
         42nE2WyoXrfFsNe2HnDnxdKJRHmki0z1CqwgPzotIJzJI1kYn24WIi9wwZBy9l5GWZAc
         OVRVYldNZhyzubUD1RxirjMHzKYk7hvqd2hR3zGSg+JWZm+nmb+WG3303lWcoWwZqcdo
         ytow==
X-Gm-Message-State: AOAM531OH3vGlmtnQxkRRXk2zCY1ixKSeP679mK1vEyuXR9l62AfBAcT
        fiuVhsnnPAaeGbo7qTO/Pt8=
X-Google-Smtp-Source: ABdhPJyvWQHavbi+JCfVXxFrbZTyn5sO7/L/HQRV4y1Sv0u8qjO/mgVavvJNDvl7T5FOE89JdkRJwA==
X-Received: by 2002:a17:90b:4005:: with SMTP id ie5mr6691244pjb.195.1617863080044;
        Wed, 07 Apr 2021 23:24:40 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:488:412e:a196:e28b])
        by smtp.gmail.com with ESMTPSA id e1sm23659387pfi.175.2021.04.07.23.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 23:24:39 -0700 (PDT)
Date:   Wed, 7 Apr 2021 23:24:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     skakit@codeaurora.org
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] input: pm8941-pwrkey: add support for PMK8350
 PON_HLOS PMIC peripheral
Message-ID: <YG6hpRiNjcfT3gVw@google.com>
References: <1614922721-1390-1-git-send-email-skakit@codeaurora.org>
 <1614922721-1390-2-git-send-email-skakit@codeaurora.org>
 <690456c09c433741900643eafad25beb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <690456c09c433741900643eafad25beb@codeaurora.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Satya,

On Wed, Apr 07, 2021 at 08:59:39PM +0530, skakit@codeaurora.org wrote:
> Gentle Reminder!

Sorry, please address Rob's comments on the bindings, the driver code
looks OK to me.

Thanks.

-- 
Dmitry
