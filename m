Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69E4302110
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbhAYEUB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbhAYEUA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:20:00 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E856FC061574
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:19:19 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 30so8055896pgr.6
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9WqsJWMuZMD1Sigd6MU7AdUSZR2vwYPP51CM1ajt7QY=;
        b=MNTDxoRkSD6+pQBnMNXkoQm9eyhYTEJhlxuKkg5oEa9eQTJk8xEhCU2s2fo6eiDdJr
         xPYHbypOthrQyOOG8r5dcgJg3Mr6v6mB1YKopoIsugw9qYkfl+OXzUXiFuUozzS4FXL/
         aNJW2G1gFfoSvF5kIvFBWoI3u6lw5MKjok4i3ymx6h/JeSUTLeTsbRjd+gHzOweFjAup
         xyPEQYa/diuMigqV1Djojwqg+kt6upb/m2bU5oeDlDdpW74sshH7G+Ulnt2ODElahGSh
         F7mlig3U1aLIi2Gc+bDLNrC6uKhQFaMge30NNCzpI4RdmAEDA9rrR29G91Cq+uih/ah3
         4JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9WqsJWMuZMD1Sigd6MU7AdUSZR2vwYPP51CM1ajt7QY=;
        b=QjAHRNDOhqNL/i4AtnJIeLyZ/IhT8zT9qW1B+rQT/5dcYKb+iuedz5xkgWC9y9NfYd
         zRYyUUjgDQTo5Mi2ZRUHV/GdFjZ+0hujTpcY2oZKp1LpVt8qVsL+Rr2XZ2RH7+iSzaR/
         iCwOUIAi2wQ40XbN7mgfa14qATwqtjBgPFm9sEPMwikwEv73ScV2Q5uUWluS+437Dudr
         H37xoDWCKxtkwo9Rl203k9XVOg6ERXZVO29Mymjd+Og081Cn9VpWkbe15X7+s5RypDXn
         OqDp3PBtZu4rbT1i3zOIEAxQEsYZ4Ai7q84DPccKwPAiKVPBuc3PidbLzb2ZI5Uy+uO4
         NnzQ==
X-Gm-Message-State: AOAM533skKe9QomoG1zfiVMTo+f+4dqVzXByxYWswD8fTLEP+6Nxz+JN
        oYbKC2OfsRh17Q+ebkAfqd4=
X-Google-Smtp-Source: ABdhPJzXDBF+ZP1c9f4eKeOpuzRDN6D1kQ+hER2Pd1+VepAH9LSW/S0z2RlzKQ0uvOeyOp9XrYgOWg==
X-Received: by 2002:a65:5244:: with SMTP id q4mr16346276pgp.50.1611548359472;
        Sun, 24 Jan 2021 20:19:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id k141sm13513735pfd.9.2021.01.24.20.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:19:18 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:19:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 03/10] input: iqs5xx: Accommodate bootloader latency
Message-ID: <YA5GxEnuiUcb8tXa@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-4-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-4-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 02:43:39PM -0600, Jeff LaBundy wrote:
> The bootloader NAK's all I2C communication after the first 64-byte
> bulk write if the bus frequency is equal to 400 kHz. This prevents
> the platform from pushing updated firmware to the device.
> 
> The vendor's USB bootloader programming dongle appears to insert a
> delay between the "open" command and the first 64-byte bulk write.
> Adding a similar delay to the driver seems to eliminate the issue.
> 
> Furthermore, the dongle does not access the bootloader immediately
> after powering up the device. Follow suit by adding a delay before
> the "open" command to avoid wasted retries at 400 kHz.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
