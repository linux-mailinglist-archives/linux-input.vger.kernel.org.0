Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E531CE7B8
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 23:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgEKVvF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 17:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725860AbgEKVvF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 17:51:05 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39324C061A0C;
        Mon, 11 May 2020 14:51:05 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v63so5345508pfb.10;
        Mon, 11 May 2020 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VMfPxGE5boQeA6utN3UYAt+SLJc6oVsZpGMcyKbC1m0=;
        b=sfcfzMYIT87h8UV3SAM/c1BlT5orCYweEaoQBwfY2Ph+gHFgGidXt43kV5eOpVYnfY
         YN8CZdM/kj3QcpGpdp5fyyuJp2yTI8ayPIIIHNmJtdXq0hySRyLUyZwdeeZgdFl6Oa1Y
         KAMDke4p9JYgZsWoSxTIGDKX7yybgXbK51/5ELD/sn6eaJwFdJqZPUA8Ma45uIFsYH8d
         s3EUOc4JLOChGddSAo2kb0dmIaVQ58zHyJPQACrZH6ewawhzrQV9HLqM+USGjkS1Rqbj
         dXjS37k5cPNXAGcq03rmqrpRXGRiUJIEz0Kezuk9n6lf9fl9TosiQC8Si1NNgNtpTn8f
         KkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VMfPxGE5boQeA6utN3UYAt+SLJc6oVsZpGMcyKbC1m0=;
        b=T5naOET+lMw16EmJ6iX69fGtXf5sVWtMOkypB+/DExEaPCqjHy4zDleyCZckX8K5+S
         /82vHYt34OmfVRYnz7+8c+MujtSePvLuK+qY5PxkECb9hx8Kmf2JaJEe7EE8nRqTdU6/
         Vpg4bc0qkMRthbx6DuL7lzTcI1K76gJ2zuEtYsZ2a4Z7JzvTut9BOgYCkxE05U9c9TeK
         o3Ex7vZxQQ25YmwniRwNI+Wr2b7xSAeCpmdMx486EBIboS/MJ/HmysOPMuzWWQitmndz
         JOfoxTHy/F02FQChdqFOHmviT/z9az0m1mbfKQ37DMLj/9fmQKDK7qmQdpiHqWNuqfRl
         sePg==
X-Gm-Message-State: AGi0PubS9WttOVifb/JR5na9CY8sIg/z011BFWMEkiiEHeK2jmHR7opa
        hej2UuOS//aemlQuYmiWP4E=
X-Google-Smtp-Source: APiQypLTVLtLlB5QQEM6cdF9Fw01hLmFeRMSTJcFzbSm8C1SUXMMmCzao5F8Oj67WtWDFOq5DrHnfQ==
X-Received: by 2002:a62:e91a:: with SMTP id j26mr18043004pfh.61.1589233864462;
        Mon, 11 May 2020 14:51:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id c1sm10089301pfo.152.2020.05.11.14.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 14:51:03 -0700 (PDT)
Date:   Mon, 11 May 2020 14:51:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     David Heidelberg <david@ixit.cz>, Scott Liu <scott.liu@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        James Chen <james.chen@emc.com.tw>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: elants_i2c: convert
 to YAML
Message-ID: <20200511215101.GX89269@dtor-ws>
References: <20200423173253.711725-1-david@ixit.cz>
 <20200423173253.711725-2-david@ixit.cz>
 <20200511203709.GA3143@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511203709.GA3143@bogus>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 11, 2020 at 03:37:09PM -0500, Rob Herring wrote:
> On Thu, 23 Apr 2020 19:32:53 +0200, David Heidelberg wrote:
> > Convert elants_i2c.txt DT binding to YAML and put into correct directory.
> > 
> > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  .../devicetree/bindings/input/elants_i2c.txt  | 34 ---------
> >  .../input/touchscreen/elan,elants_i2c.yaml    | 69 +++++++++++++++++++
> >  2 files changed, 69 insertions(+), 34 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/elants_i2c.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
