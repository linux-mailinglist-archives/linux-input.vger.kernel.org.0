Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE99E29522F
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 20:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438886AbgJUS2B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 14:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438881AbgJUS2B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 14:28:01 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECDDC0613CE;
        Wed, 21 Oct 2020 11:28:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id g16so1599303pjv.3;
        Wed, 21 Oct 2020 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IF/s4Bj/loImFjDigWUw9owchow7UQ79UQNQgh6UzFU=;
        b=mYy+DTpA/zpKYrmSP0rCC3VF3r7kLugwuWaaW9U6Nj6OOWiIJJaFKRyMfKd+6TVOHz
         rc0+MrbnMSIYD/dTk0vY+KEoWLo33qrD38IvVZ1IPhF9v+RnhZ/OqTmsW1nEr7j7ameu
         Yi8aAzjUL9dQMqDKYdycSdJp0TbKsfZR25M9XWk22T6ccN2B+xrV2Ib8qZAI4Omn1qew
         8+pI81y1YJ86oyG4S4l84E5+4dGHpMMCNDbIGX71vssDlBnwfPgm+gmObNLaVVOJCod4
         RBesT/2QQfw+Ty8bAZsOUFXDOyK1r9J+ULmRq0x0hkFdLOgcAWsDsMCyH2/7Kg5V1u2M
         m9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IF/s4Bj/loImFjDigWUw9owchow7UQ79UQNQgh6UzFU=;
        b=Pz/ZSIfsSlJljiTkUXheQ5d2qBSafpDSZk64a27vKWbIQUdTlb5jiq+E7kpusFJ8fO
         TPYj79Zhomy9HXx4q/5lyw7fjE1CqQFOjlrZmhVZQS2+LeqG2whpTYfSKHIK5cMyu+9d
         bReYszvI7+70OR5B5XbMxNWNxXYscDsxJTErENoQMn2JxB7xOxaGmrWzj46RLUEO8PRw
         jOXaX/+9wp8GvLJDqz+Lgh3sNdDYZcOo+ni+GX6zQxm1X5wfFm163DD+1Hp8hCWvSInO
         Yw+4OwaOO3ODk9S6EUbwDDxwq7py9XQrTiaywEJZXZlhVFrkPx/nlH4VbET5LNmlCLYb
         s4Xw==
X-Gm-Message-State: AOAM533GC8B9GoUVUY65o8O1njYlJRI1AKZVbMnPXSoTG1pC8bT2q5a/
        edepvNB1m7H5pcAR6xemXlU=
X-Google-Smtp-Source: ABdhPJxcXuN5vS1Tk10DKp8I3dnGMQmPkDCBMWXEVEz7wmXQug/nIK37OBzW4xxP6A0ADofqwaFMaA==
X-Received: by 2002:a17:90b:38f:: with SMTP id ga15mr4497112pjb.33.1603304880771;
        Wed, 21 Oct 2020 11:28:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b21sm3113638pfb.97.2020.10.21.11.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 11:27:59 -0700 (PDT)
Date:   Wed, 21 Oct 2020 11:27:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH v1] Input: ads7846: do not overwrite spi->mode flags set
 by spi framework
Message-ID: <20201021182757.GA444962@dtor-ws>
References: <20201021090434.16387-1-o.rempel@pengutronix.de>
 <DM6PR03MB44110236C07B05C243009E4CF91C0@DM6PR03MB4411.namprd03.prod.outlook.com>
 <20201021105614.tc3jnv5g62hvl5vg@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021105614.tc3jnv5g62hvl5vg@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 21, 2020 at 12:56:14PM +0200, Oleksij Rempel wrote:
> 
> As you can see, I would need to configure my dts with spi-cs-high flag,
> even if the hardware is actually ACTIVE_LOW. If I will go this way, I
> would risk a regression as soon as this issue is fixed.
> 
> Since the spi framework is already parsing devicetree and set all needed
> flags, I assume it is wrong to blindly drop all this flags in the
> driver.

Yes, but I wonder if the devices can only work in mode 0 we should be
doing:

	spi->mode &= ~SPI_MODE_MASK; // to be defined as 0x03 in spi.h
	spi->mode |= SPI_MODE_0;

as we can't simply "or" mode value as is (well, mode 0 is kind of
working, but just on accident).

Thanks.

-- 
Dmitry
