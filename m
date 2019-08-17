Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B46C912E8
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2019 22:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfHQU7y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Aug 2019 16:59:54 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36175 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbfHQU7y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Aug 2019 16:59:54 -0400
Received: by mail-ed1-f65.google.com with SMTP id p28so7981726edi.3
        for <linux-input@vger.kernel.org>; Sat, 17 Aug 2019 13:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vdwaa-nl.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H3/hqjFreZbVdsD3spVALh/sMq5hWljlFPJy2TikW0Y=;
        b=knj0fNuzUBdvKVFSKr9CTKN0uEaZMbE1batC7gPJpefTYHOJWwOgardB++8fwNV0iy
         /7IsVflkwG4aoG0CI4EyjWAg6G4WsjHadlInUSF+3WhPdzgrxMDgM1uzpnWB1DQtZ+0l
         dxV5Fz9/XEOxeqB9t6Pm0eUS2NhS3txPn/wf0MXzdTppr4AFrM7viEt4R+4FBdkcTOss
         hgaAcAptougRfAp0bir6ZG2uwB5y3fT+bqzHKfZuY1BZQdVMS3Un+rBBmKtBWcNc+wft
         3yIUCa7VysnDdq3qqbxnw27qGHi2bYQcEVoTKdoFtz8cXk35losHPhPhWndSXzASfOgC
         A5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H3/hqjFreZbVdsD3spVALh/sMq5hWljlFPJy2TikW0Y=;
        b=DkPzXx8TFF15z86iVau9gD7KbRuzFvaOn8NXi7l5AsqqG9X1ui7I+Ej1kbcDlSksWn
         FipVTWB5Hen7N8ViZ2jIhQ5JuHlaNlk5LEjkScmTZ1oOwP6lpU4sU2deeGYxbASb2DUr
         FA9pnCVZLrFGxL62NEbAXSRxOAbM6lJ2OkrdkW32w0cAGhTdZ7y0KK3p04R8jSZnFUac
         r0XZUwJFHTXGepEoGny/deRmpujc6CGSWOTAY2d6zi7gz1aDYV0V/Y+cqKNuN4lIX+ku
         LmFH2JWPPJY3iHzb1C9bt4XT9Lvw44I1qcO/V6Opmqk/ePbUHnI7zC0fab601qby1yCk
         A8BA==
X-Gm-Message-State: APjAAAVNXueJUj7ZhEuaiOiC9PB1RDzW067ey056WWeb/JGYPOvtyF3T
        6D5tWq68vW9I/86/WWaFnRIsTQ==
X-Google-Smtp-Source: APXvYqzogpYPCVLq9PyEA+d0t+JESl/xNvXSs68F6NsfixMynZJ1SH/lYLz8saMlsLKikvtLljLIQw==
X-Received: by 2002:a17:906:b345:: with SMTP id cd5mr14779803ejb.239.1566075592399;
        Sat, 17 Aug 2019 13:59:52 -0700 (PDT)
Received: from gmail.com (83-84-126-242.cable.dynamic.v4.ziggo.nl. [83.84.126.242])
        by smtp.gmail.com with ESMTPSA id 11sm1355553eje.81.2019.08.17.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 13:59:51 -0700 (PDT)
Date:   Sat, 17 Aug 2019 22:59:51 +0200
From:   Jelle van der Waa <jelle@vdwaa.nl>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Add support for Razer Blackwidow keyboards
Message-ID: <20190817205950.kkaemyx5ulg4xrru@gmail.com>
References: <20190705221605.28293-1-jelle@vdwaa.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705221605.28293-1-jelle@vdwaa.nl>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 07/06/19 at 12:16am, Jelle van der Waa wrote:
> Add support for the macro keys on the Razor Blackwidow keyboards. By
> default the macro keys do not work and have to be enabled via a feature
> report. After being enabled they report as XF86Tools, XF86Launch5-8.
> 
> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>

Any update?

-- 
Jelle van der Waa
