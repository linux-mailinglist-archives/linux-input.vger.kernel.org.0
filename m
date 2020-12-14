Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2A92DA3E8
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 00:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441258AbgLNXBL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Dec 2020 18:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441400AbgLNXBC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Dec 2020 18:01:02 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3AC061793;
        Mon, 14 Dec 2020 15:00:21 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id c79so13211554pfc.2;
        Mon, 14 Dec 2020 15:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=090tfOfLBXA3a9GUTJRAKpFjvledKH4Bekhs4Eg20Pc=;
        b=cdX7pnvO3BEHfIrpZUALNVRhY77Yvx1vsmWX11SwI8DdvoYBKo0LCxNGC6LtVMQMxs
         lwOaK83GOusmzA2A+JKKmHFTtzxdw+rrMn7nO1tQqsQcru9sH/FDc8e/7y3fpxyf395b
         2Gj2xKoSSxma76aY0dAiQJe2GanygHe9Ac9OCdu207SVBF4dxnMauVbafFEETkEcADLe
         Lu+a9vLZdcdge/yundmOwsr5cz2Rsd5MDm7Qc+37+MKZ/XQi+2R8H3q7mkU3tjSq+tNA
         97d2dtbX+ILh3FBxTGHO+oFi1r2YOAXdIr0sfSiV2cJK56WjrsKCdd5T2hDnvHoblhY6
         sIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=090tfOfLBXA3a9GUTJRAKpFjvledKH4Bekhs4Eg20Pc=;
        b=Cb4Pn4CD5dD494Ho89kpkzuf51MgAYXNB9++uHrsRTJmAJIdLg0/ihtseccn/IYcha
         SBawYqeLpQ/Ob5nr70ceNm3w9S3yAFTzIDBYQdggy4dDypFDZy7+xjuJBp+ogkl+rJlG
         5r+Cjtok7Cdo1LqxlT8JMv/Kg69/DIrPGIwywkm/4SI6c4IdNCFkVBtRyPIKgMVji1Im
         TK8gnNFrrCS7Kp6qG2L8Lzdex+/Z09zYhXUPKsAaePkZ+wSnyQBmYQr7E0vQn8w+HA9M
         NzVh/2OTXnDoq1PJCwH4OfxHqSQGQz4jpCC96drO5vlg8yT8w8xn5N2yiB+tPKXNrS95
         2Kig==
X-Gm-Message-State: AOAM5312ljVEWApYH96QcNBLjcc5eXcMhv9t3MCYF1qgjHSQFEaGMXgj
        bDtfU8+zhSZSjdaHOYO3nBU=
X-Google-Smtp-Source: ABdhPJwVEnbeFUdm4qb2knm8penZArC7pDe+Nf6ORp2jRc29SSBt8lCXcdEATS/m8aGRiMbj44E1EQ==
X-Received: by 2002:a63:5a61:: with SMTP id k33mr25605135pgm.12.1607986821342;
        Mon, 14 Dec 2020 15:00:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id fv22sm20358841pjb.14.2020.12.14.15.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 15:00:20 -0800 (PST)
Date:   Mon, 14 Dec 2020 15:00:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Dudley Du <dudl@cypress.com>, Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: cyapa_gen6: fix out-of-bounds stack access
Message-ID: <X9fugmc5XldpHqnW@google.com>
References: <20201026161332.3708389-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026161332.3708389-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 26, 2020 at 05:13:29PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc -Warray-bounds warns about a serious bug in
> cyapa_pip_retrieve_data_structure:
> 
> drivers/input/mouse/cyapa_gen6.c: In function 'cyapa_pip_retrieve_data_structure.constprop':
> include/linux/unaligned/access_ok.h:40:17: warning: array subscript -1 is outside array bounds of 'struct retrieve_data_struct_cmd[1]' [-Warray-bounds]
>    40 |  *((__le16 *)p) = cpu_to_le16(val);
> drivers/input/mouse/cyapa_gen6.c:569:13: note: while referencing 'cmd'
>   569 |  } __packed cmd;
>       |             ^~~
> 
> Apparently the '-2' was added to the pointer instead of the value,
> writing garbage into the stack next to this variable.
> 
> Fixes: c2c06c41f700 ("Input: cyapa - add gen6 device module support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you.

-- 
Dmitry
