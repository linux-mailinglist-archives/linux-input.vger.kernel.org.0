Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9946636F29A
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 00:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhD2Wat (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 18:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhD2Was (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 18:30:48 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FBCC06138B;
        Thu, 29 Apr 2021 15:30:00 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id f11-20020a17090a638bb02901524d3a3d48so644189pjj.3;
        Thu, 29 Apr 2021 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vD16s+kPEg17tAvjGtyrhia3xTJ3cQrb/NORF/V64sM=;
        b=S40OGF3ABSVnr3Fo5DFg9/0qicYDCtxMqskNTFitNc2+EweN2U7JvYVmU1v5NDLC3H
         EFSDqTqKT43gi5U1PkPY67dECCx08bJZznxGKVEqjMJv7A6HqcdkEsdK1ifIkd7aYk+H
         hMu0zY5tXGicbGIdp21+gjrxUQkZE8QPp3CS35UlQ7tWuT3ItmBnvejghFkylDdG0OPP
         nXvqylHSgzRCa7xMfYbyQCSA71bCzQ0SqBeqBhBrDKjEEOAAhLwGuf8idSb4xgRxtZy6
         5uiPSzTnAPs3glvxCM1Gop0oK1q7y18uzU0gtgGDOGeh4WhpfHYxOFuCvjSBRaHo2ZWe
         sSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vD16s+kPEg17tAvjGtyrhia3xTJ3cQrb/NORF/V64sM=;
        b=CyVJCy8jeEOQxwNgRaqv5gP4LpSsOXMM01agRHd6FSaD2XHqhjPed59qvR04h3Afwg
         wOON48z3SAv/JqvSn7eJlMrzpHeacAmQsdL27im0MPxaZKBj6+AnbdFseMmcC9CCk/Yd
         u8j/wPufda7bjM7K8YKG8UpLRhENcSSeNCqTOvcebgrZ2j82eOfpmD+yWm4GN7GwRhcp
         WGObxNER6rZPyZHevJpv/M4mr6VA1hGY7eGpKY5e2trbBcf6qW+h7SYf483LFPe2r9nn
         jpKqK6gmOqyUdpVobu68cZ6Q3Gdh+9ZEiAG1/fqOPI4aA+yAuTADRh6o+OCrdhLV1+hs
         m3sw==
X-Gm-Message-State: AOAM533ZXOKf3ZwgMIiY6tfaH5UOtU3tp3tcSlNvUhvxDqfz/YKaDu0o
        bZ+6x5ZPguCSjTBSIypGER03PHK4FaM=
X-Google-Smtp-Source: ABdhPJxR00sdCTfjHcMg8iFzxdOAl7y9hkrxJJ49tklDv1vt3TiNW4yjFv2A2HOqHai6aYCjBd4OIg==
X-Received: by 2002:a17:902:db03:b029:ec:94dd:b6b3 with SMTP id m3-20020a170902db03b02900ec94ddb6b3mr1957944plx.69.1619735399949;
        Thu, 29 Apr 2021 15:29:59 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6b9:8bd2:eb38:bd68])
        by smtp.gmail.com with ESMTPSA id s3sm992928pgs.62.2021.04.29.15.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 15:29:58 -0700 (PDT)
Date:   Thu, 29 Apr 2021 15:29:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Matt Reynolds <mattreynolds@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Olivier =?iso-8859-1?Q?Cr=EAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for Amazon Game Controller
Message-ID: <YIszZBM+za8gqFVP@google.com>
References: <20210429103548.1.If5f9a44cb81e25b9350f7c6c0b3c88b4ecd81166@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429103548.1.If5f9a44cb81e25b9350f7c6c0b3c88b4ecd81166@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 29, 2021 at 10:36:11AM -0700, Matt Reynolds wrote:
> The Amazon Luna controller (product name "Amazon Game Controller") behaves
> like an Xbox 360 controller when connected over USB.
> 
> Signed-off-by: Matt Reynolds <mattreynolds@chromium.org>

Applied, thank you.

-- 
Dmitry
