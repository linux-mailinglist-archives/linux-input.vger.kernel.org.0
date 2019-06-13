Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9558544F91
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 00:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfFMWwc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 18:52:32 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36532 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFMWwc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 18:52:32 -0400
Received: by mail-qk1-f195.google.com with SMTP id g18so505730qkl.3;
        Thu, 13 Jun 2019 15:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gdkOgkPervi+1nQkxYS09qW0ZcEmkBJxScc1uJAaFCg=;
        b=W1cIn40qzsU+pXcCx0+yA/fodAnSnflEj51uza+GpD5I5s249U4CdNnzITZGe/FHIr
         42ckQ3Av0ZJWTVxcLpLQK/H3Pv9lyMWS3Dt5EDJIQpH0mbU/sYPHJerw/Sp/AHWledph
         vP1yBnLZM+aj2V0VkU1tWeQNFgE1Yc8FBIJnMoLHsHyLn/3nNfQtEgfOxoCCx+QxZjk4
         h6Q9ZPNbMYOQmqKbOejTVaZ2/wTnFsVZ6Thmvljwlwt/1v2+6RTtrilWoHdt0O4y9L7y
         yRrL5EbMGM0qy9h2dXH2BhfOuTRsru7fHtpGe6LxwMR1pgUhYxCm35YH/AsQyddB/Maf
         S/qg==
X-Gm-Message-State: APjAAAWmUONJDsE/OCJszRpBlyc/3oiA9jET3PoGZzwmN83rXXtHtabf
        zVhnwxRbstETHm/We5oxvQyvEJM=
X-Google-Smtp-Source: APXvYqwnB/OyQz+QMff0Pdx6WXfp9i0yCk1jXHrOelWB4Z3mC+eSjIA/7P5CQ2FV1CHjIniaMDzbBg==
X-Received: by 2002:a37:d16:: with SMTP id 22mr54321805qkn.232.1560466351357;
        Thu, 13 Jun 2019 15:52:31 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id f189sm610484qkj.13.2019.06.13.15.52.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:52:30 -0700 (PDT)
Date:   Thu, 13 Jun 2019 16:52:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stefano Manni <stefano.manni@gmail.com>
Cc:     nick@shmanahar.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, Stefano Manni <stefano.manni@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: input: Add wakeup-source for
 atmel,maxtouch
Message-ID: <20190613225229.GA19122@bogus>
References: <20190517211741.8906-1-stefano.manni@gmail.com>
 <20190517211741.8906-2-stefano.manni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517211741.8906-2-stefano.manni@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 17 May 2019 23:17:41 +0200, Stefano Manni wrote:
> Add wakeup support to the maxtouch driver.
> 
> Signed-off-by: Stefano Manni <stefano.manni@gmail.com>
> ---
>  Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
