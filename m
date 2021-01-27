Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64F4306474
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 20:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhA0TuV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 14:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbhA0Tqa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 14:46:30 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4193DC061573;
        Wed, 27 Jan 2021 11:45:50 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id o63so2279346pgo.6;
        Wed, 27 Jan 2021 11:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JSkrFLTJr6pGJf1IDW3RWxp1Agf1ykJ+k1NVDD7G4js=;
        b=d4Inqoi4OETMUYSfyXBhCdXGuRtYDtzq3Mm1sOoNfYC/bQ8/E3BKpK1AkP5QYx80AQ
         Jtpt9j2z3fgJ7O1Iega2owyIm/3YrzGmTEcxDEMMJnGY7LCm0NExWaxsRvOjPXIFB981
         CYe1KhGtImvHqiHb1NXea8IQ0XwZ/CWrNOjZQ838F6Ay0YhXu2l2k4aRVvhET/NrJp/D
         M9YcC8p0CwEruHayktiLitILgW19oW9eyekKOBrMuzZf8Rwt7d9rKEYN67mUAef72GZi
         +tv/Ol+Lxv1yout0YwokU8NGznAYvoKNzrkgzrpnOTsRE7v9YWswFTPEB5X36HzNs6HC
         3INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JSkrFLTJr6pGJf1IDW3RWxp1Agf1ykJ+k1NVDD7G4js=;
        b=aS58enf+/mkq2+MU4lw9eLDCkHKPmp7jFkm6LlMG+fnZ/wBW+Os+OWw5m58UUEzq4b
         wOmo0pxRiTiC+jRKkf2AJG1fk7/Oh4mxo0d6sct+p0sP/x/AUjh5G4GICTpoqT49f0nW
         0ZY9BTropGaF/FKw3Jjfr+Tb4YeGJVspnKP/MVwRnjsgaLzsZC5OAju7EzaXMH7myQHb
         G8+1V2fXBTv4gW9JFXsd5prp8T3vnWp+Gpi0JQn7W/7H0cKe7LXO8tqSFOTp3HuDgSOL
         IH9LmB12+JexmgyBcriBrgLSqqfXklOjEJS9Pqn0QVYrn9skEMXnSiD+/czVudT4ah+P
         aBEQ==
X-Gm-Message-State: AOAM533zsWsWDp8hJsi6K3dWbAVjkq/DhKOYKq1OYHigUjeu0SbLvu5Z
        GOh68m7TbbqG2khfDyCFeHhhbpZW40M=
X-Google-Smtp-Source: ABdhPJz0dniJCSTRS3V+eXeLH4AAWpwwBGf4XOuyt1J86aDlphShf4yxVvAvHTU27ch9ipyxKuxhCg==
X-Received: by 2002:a62:1dd7:0:b029:1be:ef0d:9507 with SMTP id d206-20020a621dd70000b02901beef0d9507mr12188580pfd.62.1611776749630;
        Wed, 27 Jan 2021 11:45:49 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w13sm3337613pfc.7.2021.01.27.11.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 11:45:48 -0800 (PST)
Date:   Wed, 27 Jan 2021 11:45:45 -0800
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "maz@kernel.org" <maz@kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/12] add IRQF_NO_AUTOEN for request_irq
Message-ID: <YBHC6SzXAOSNoQnI@google.com>
References: <20210107223926.35284-1-song.bao.hua@hisilicon.com>
 <848fb07c3073401bbbe15db71f5922c9@hisilicon.com>
 <YBFvYStmGeChUJlO@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBFvYStmGeChUJlO@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 27, 2021 at 02:49:21PM +0100, gregkh@linuxfoundation.org wrote:
> On Thu, Jan 21, 2021 at 09:38:28PM +0000, Song Bao Hua (Barry Song) wrote:
> > Hi Thomas, Greg, Dmitry, Marc,
> > Any further comment on this new API? 
> 
> It's not my subsystem, I'll let the irq maintainers handle it :)

Not my subsystem either, but I would like to have this feature
available. I do not like calling irq_set_status_flags() before
request_irq() as at that time we are not ensured of irq ownership, and
using disable_irq() afterwards is indeed awkward.

Thanks.

-- 
Dmitry
