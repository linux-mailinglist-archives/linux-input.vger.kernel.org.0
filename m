Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1CA9232BEF
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 08:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgG3GcB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 02:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgG3GcB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 02:32:01 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0B0C061794;
        Wed, 29 Jul 2020 23:32:01 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z188so6605636pfc.6;
        Wed, 29 Jul 2020 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RvzCBa7ZKzsFHpeomJG395o2tX0/hQLE5XBknXX1p8A=;
        b=n4ViKvdU4I+Ar3Wd8GhMLtfd6te0chKBQJo+tfTVrXQu9SVIIdJlnjiH78kQVuFr2Q
         PbjHNv9+exvloLqJHa8/ekgdagRuOsvfojB0nlGmlfJEJ3C81a5V9myp0EpjvW/+8hxU
         BMZsmdcellq2/44rIs2u2jMc4yV4CVD3/NWaP7gS9RpZLLkXqLO90hoD45UxLBN1T0eH
         y+f776yiW3Z5WhhpRqvH1c//J5Ai5t7k69Yu0/sX/JIr+pd8xcLmfkAR2XVbOGReE4BB
         Lheq0p7D+SUii1eheItc4nBKbaLdAWcDKpPIEQiTiaTctTSNUCgVS9NBvxeT4qda73IM
         QbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RvzCBa7ZKzsFHpeomJG395o2tX0/hQLE5XBknXX1p8A=;
        b=Kdq5u56veq9yQLf8pIoTdvX8acWNs3n2GHkCUW3U8H+5hvNydT3jPDsEhIYtFQSGoy
         aKX3BWe848CRn1DCATz55uFt4PjdHVRK67N8hqKpLeJNtzwigQBP3JUSymKk8B51UHhh
         lNwrrV24qCTtLXUsxyxJdDACwAWGhABgQsduHJXZsO8Dq9EoEaTJIaVaB76k8eAk/qnP
         87OoGjgTVV3XyLYOD0D8kakbhKpb4B3Ch53D8PCRlGW7b6x504MA77eIGUR8adVrp64p
         45lX/HB2VFGb1dwwklwaJXTS2QZt104/iVx2wQk0x+SfxUEIzPFEf9aevXYIyyp6+wht
         ARQw==
X-Gm-Message-State: AOAM532Rp2GMOwBAuA8ub3wXoMzR/d555vGcuiPRuBar+6+ZuTStmoHV
        cJ/gh+RlfHgeQgNDT9WaeCs=
X-Google-Smtp-Source: ABdhPJy8Vs/jtlDtyaFLRllhubqh5QoWzAFJDLFw5NqxD2/prfbDu9WIJnWc5FhakYqbn8LV0JPu8g==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr32266983pgh.255.1596090720363;
        Wed, 29 Jul 2020 23:32:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 9sm4504182pfx.131.2020.07.29.23.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 23:31:59 -0700 (PDT)
Date:   Wed, 29 Jul 2020 23:31:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jingle Wu <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        kai.heng.feng@canonical.com
Subject: Re: [PATCH] Input: elan_i2c - Add ic type 0x15.
Message-ID: <20200730063157.GG1665100@dtor-ws>
References: <20200730060526.12439-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730060526.12439-1-jingle.wu@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 30, 2020 at 02:05:26AM -0400, Jingle Wu wrote:
> The update firmware flow of ic type 0x15 is same with ic type 0x14.
> 
> Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>

Applied, thank you.

-- 
Dmitry
