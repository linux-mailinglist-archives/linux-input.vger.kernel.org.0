Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CE9D031B
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 23:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfJHVyi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 17:54:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39647 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfJHVyi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 17:54:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id e1so23939pgj.6;
        Tue, 08 Oct 2019 14:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BtHDZ0PRtKhQIM9Q2m33t5tA8QUCKAJDqO8TCXWjIjM=;
        b=ez5+sEPiCoBWMsSnAzDT2s4hNSG1DNwiT4tK0Yb1faoE86vKvCcANQa98TnLswaiwQ
         oz5OVVo12m1rntflHTTPbkYKOh6jhlBktUsTryZ7l2UxY17aKHXknJX+86qXPyMmnNom
         RqX6a7YHwtOiyDdCiEv80xiHWZ+oBmIBGFqatkF6g2Uas6lz1zF2UJbW8iwBnMd2Bgn8
         0VVm98/l0zapzqnkw+PFTPh0WzYSJR18tfOLCpuMpKadPajH+5wMkz95lYbQmNY1VRwh
         t/WGA1C4DIW2Ps/iUKjiZPdvEu2ji6I0ga+EQH3tWRl2QwuPYN8I/mZDhZQGnTnGFXuf
         ZNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BtHDZ0PRtKhQIM9Q2m33t5tA8QUCKAJDqO8TCXWjIjM=;
        b=GqQNgrF0dX1gNRsSEwM/UBfsMU050qkrzg3t1NlIOUCS41BNungAx7/DcJi33uPE38
         rsnnstT50jufSpAQUYAmbKkzTdagRfjOYNCpGwhkXYsiFXPNilGF8m3dQvMHlc54CTiA
         9PDWSuzs+v22vpsDrXmRS9TPO1Ta4f+XYuoM6EZKP2n2NPoCyHnNOgjePAG46Mu+vvmM
         bUf1prgJCx8uhchEPnmwCCetEEVSHKuFx5TGllk0JUIjiX90qIfIeb/t3TVIIsy7FPPC
         o36B9R2oXs5ss349OwgGB35+p/YCgHMN9TTWKX8p1xbZZSz4EYeNqdZFV5bRkgrbBxHl
         0F1Q==
X-Gm-Message-State: APjAAAWW65XGFSf2cBKqykp5K8HhfRBjRONbTrk9Euhfk7nNJEVcivaj
        xfUaiccW8Equ052G9cUsYOk=
X-Google-Smtp-Source: APXvYqyhjOkrrVMwhSewlrHX5gf2yJrw9cRFovIZ/xrHXPgiqei0wHiZ5dzpXNghSLGC8XUtq3e3qA==
X-Received: by 2002:a65:5a8c:: with SMTP id c12mr656375pgt.140.1570571676907;
        Tue, 08 Oct 2019 14:54:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s14sm94553pfe.52.2019.10.08.14.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 14:54:35 -0700 (PDT)
Date:   Tue, 8 Oct 2019 14:54:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andi Shyti <andi@etezian.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andi Shyti <andi.shyti@samsung.com>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: mms114 - use device_get_match_data
Message-ID: <20191008215433.GH22365@dtor-ws>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007203343.101466-2-stephan@gerhold.net>
 <20191008114426.GC4015@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008114426.GC4015@jack.zhora.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 08, 2019 at 02:44:26PM +0300, Andi Shyti wrote:
> Hi Stephan,
> 
> > device_get_match_data is available now, so we can replace the call
> > to of_device_get_match_data and remove the FIXME comment.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Reviewed-by: Andi Shyti <andi@etezian.org>

Applied, thank you.

-- 
Dmitry
