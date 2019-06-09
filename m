Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB79F3A9FB
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2019 19:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732863AbfFIQz4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jun 2019 12:55:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46708 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732858AbfFIQzz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jun 2019 12:55:55 -0400
Received: by mail-pg1-f196.google.com with SMTP id v9so2025806pgr.13;
        Sun, 09 Jun 2019 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M7xQDBUJUXbjT1xTBPn3z0Ls7eT/cDbNpvmzOFS4mIs=;
        b=od0DW7mXILIxtzb9YOOPr3b2ifZjUahABMHRUn5+2XR+mX1NFvHojc8UAcarVeHn7R
         +dRsvkBhw0G/RFo/2cL4IIWrqW/eZz4TgFA50YoQ/8Dxxz+1WLAKZj9OkepiFHznZSue
         /Tp0eW6jJ77WT+xGRTwte9XHnkEq2EKKDqqbYhFHiuBVME+oGcd7IfdeZXWzmPzNuWj+
         DgC7qJSfxCTDPm2yHLu6763lsjXaFNfb4lxJwzF4wwslbttuo6W4vHEMbNvl6lYy2iF8
         mLKt6ikR6cbXbjMvKbSxMaMlRWbb9NDn6PzttOwJqafJl+8YOSiAnGn6l4koH+399qeh
         0LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M7xQDBUJUXbjT1xTBPn3z0Ls7eT/cDbNpvmzOFS4mIs=;
        b=kLls5aL3EmOAoBKL02uI4kVJgy4V9Vmnc0y0FhmIi59yAPWA+WJKO+NdkVxNx5yfB8
         2SCIamJBUVJuI/Vy9Jn0hJrzD4/KG8QtU/VezyFPOlS+77AoaLsg3YyOTTtCOM7tfauP
         ypW5RowwxgqFEtHvWqV27gnEKWqUuJf3YoPxgGRtkQU+HcwE27C9XMNGsO0vdibNz1zI
         gsVYWzQiSTKHrwyVi9P9ZliHLYKeqqvO8YAV2wIuA0TphSiryLxQAgYEzvH69VV5H2f0
         MEd9xhAT/vO/24Uh1Gksat6qiVWf2I/b+zCaVVKCHr4MMriTm+RcpvvsB0kc6kU0lMlt
         H1NA==
X-Gm-Message-State: APjAAAW/SNdLB9hHFhO45MxulMtWoBX9DPhT2WVN36qujePFFQHyrCPn
        lD0SfR4JNh0AQOgfZAp63PQ=
X-Google-Smtp-Source: APXvYqypmEVXPW538ptwnuetC1fFgU0yjgAMzknezhL/QdxMGDXWQ3SG8niix1WUTo+JkGjCgndglw==
X-Received: by 2002:a17:90a:8c0c:: with SMTP id a12mr215814pjo.67.1560099354211;
        Sun, 09 Jun 2019 09:55:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x17sm7042308pgk.72.2019.06.09.09.55.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 09:55:53 -0700 (PDT)
Date:   Sun, 9 Jun 2019 09:55:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Aaron Ma <aaron.ma@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cheiny@synaptics.com, aduggan@synaptics.com,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH 1/2] Input: synaptics-rmi4 - clear irqs before set irqs
Message-ID: <20190609165551.GB90002@dtor-ws>
References: <20190220164200.31044-1-aaron.ma@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190220164200.31044-1-aaron.ma@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Aaron,

On Wed, Feb 20, 2019 at 05:41:59PM +0100, Aaron Ma wrote:
> rmi4 got spam data after S3 resume on some ThinkPads.
> Then TrackPoint lost when be detected by psmouse.
> Clear irqs status before set irqs will make TrackPoint back.

Could you please give me an idea as to what this spam data is?

In F03 probe we clear all pending data before enabling the function,
maybe the same needs to be done on resume, instead of changing the way
we handle IRQ bits?

Thanks,

-- 
Dmitry
