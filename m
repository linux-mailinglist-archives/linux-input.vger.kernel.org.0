Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6174BD0329
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 00:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfJHWAU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 18:00:20 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41782 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJHWAU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 18:00:20 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so26547pga.8;
        Tue, 08 Oct 2019 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K8VwQ8TCTC5/lrHVeyiW+MeWgBKPPjSQ/SHqffwjhy4=;
        b=EjeMoo6mfQOP0n9xeZlsTtCsBU1AuRIGmMk4KQE7ADpiVua7YXe7RFmbF3EGo8JzgY
         kMWlIewGlijC/1STqK6+nLrmbzKU8HhuE/NsInavlZlMkBdx65+8mby2XEGRxgBlNh2r
         IiKX+bESF+EFe3EQ9amxEboKxBeRDssgKIzRT1IUkkjIyO0JBOeeQJklvGgYKhJYCG6V
         UPjUPT77uePy7cp0bH7yN2s7QB9aAwcLeDukuhQv6of5YfdzU0+QJQme8rN8elcLfJ9X
         QDY6ACLYcWPkgKRMc4Qa3cfMOoS21tCapqPVv7ki2G2FbFX3Tcou/b8Q7PBrCe1g+x5W
         iDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K8VwQ8TCTC5/lrHVeyiW+MeWgBKPPjSQ/SHqffwjhy4=;
        b=tWjjoEYUi38k2xOEk0gWOc4q7kFPCChpGQXGf4GbIyGJnapevIcx6pRX4ncnt9KRbf
         TbpugFsfJQeKyfHrxIX/lInq5Bt442NwN+1i/3VnLVinG+gUG7DQf8nPjn+J0TfhA1CT
         Yj3G1o+C/CSts4rbriG2N1GzJkNA3kBxVo44UxJxpNmO5MbbMw/SHLBwLg7yr4weQ7c/
         1DH9s1F/VW3NdX8pz0YPCGkgmLp+sMpEfOzoWXP6mm2ifuhPK9nWrIk2svEzwCS3wPrK
         xQo3ZJEdnuyp2G4E6d7GUcqb3iBN+QpLF7ZEdG3eKalshkaPAOL/1WoEvWK9IDOq6CDA
         pssA==
X-Gm-Message-State: APjAAAWuUvpr9C1USMlEdt/WWun7H8Dr8zHAtedmWX1xaxQbFwI1mnL/
        4RS1THs5pJKlIYhlJQMQThk=
X-Google-Smtp-Source: APXvYqysYd5UL6IiBu3iTKiFYZKZnVf9LyvpnmVljoO76NQu5tU14obnuxA7Fz23fDzTAUwIwswgWg==
X-Received: by 2002:a62:5ec6:: with SMTP id s189mr173438pfb.30.1570572017861;
        Tue, 08 Oct 2019 15:00:17 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d19sm150685pjz.5.2019.10.08.15.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 15:00:16 -0700 (PDT)
Date:   Tue, 8 Oct 2019 15:00:14 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>, Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: mms114 - add support for mms345l
Message-ID: <20191008220014.GI22365@dtor-ws>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007205021.104402-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007205021.104402-1-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 07, 2019 at 10:50:21PM +0200, Stephan Gerhold wrote:
> MMS345L is another first generation touch screen from Melfas,
> which uses the same registers as MMS152.
> 
> However, using I2C_M_NOSTART for it causes errors when reading:
> 
> 	i2c i2c-0: sendbytes: NAK bailout.
> 	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)
> 
> The driver works fine as soon as I2C_M_NOSTART is removed.
> 
> Add a separate melfas,mms345l binding, and make use of I2C_M_NOSTART
> only for MMS114 and MMS152.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Note: I was not able to find a datasheet for any of the models,
> so this change is merely based on testing and comparison with
> the downstream driver [1].
> 
> There was a related patch [2] that removes I2C_M_NOSTART for all models,
> but it seems abandoned and I do not have any other model for testing.
> Therefore, this patch implements the least instrusive solution
> and only removes I2C_M_NOSTART for MMS345L.

Hmm,  at this point I am inclined to pick up Andi's patch since it seems
to work for you and him and it looks like Android drivers are not using
I2C_M_NOSTART. I wonder if this was some quirk/big on the platform where
it was originally developed.

Any objections?

Thanks.

-- 
Dmitry
