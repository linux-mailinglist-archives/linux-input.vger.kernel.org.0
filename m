Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAA31CE7FB
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 00:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgEKWTR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 18:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726024AbgEKWTQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 18:19:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D71C061A0C;
        Mon, 11 May 2020 15:19:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f23so4525128pgj.4;
        Mon, 11 May 2020 15:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ny1oESjlURzUIvbNp10WZ3krXJaCpCcixtymKoF2XMg=;
        b=vMETs3qtE1vmM8FxQxAA+J1MdrrHP0M8pYm3VtirAx4ts8WVbwpRJjmcLcY+5aW4F2
         wwGKsiA7eG1V/bjCivCiZNvI4KJFNwYAj56DeBVAinQ2jnguejeoc9Owgko9ee7iSKJz
         GdymySqd3oMLHWy7Ivx3DeDoxoGtaMNj572v19RNqTH04OhZBxTtkvSKtC1Izv6a1S6D
         ZtY3x/ngkiGO9w/+VWBtjPscVw3icVqKd7RxLCRGR7c0qBiuf9Awrc39nRuz5mzeeEZZ
         H0GaTYH316GRfZlzUaVjfEyrF5lVBCCTrIMEelzeXSmmnojENrO+musp0E4MWFouQK2c
         G8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ny1oESjlURzUIvbNp10WZ3krXJaCpCcixtymKoF2XMg=;
        b=m9YruTEZjYjjzUAaTH6MrDeSjVeligg3l+ALSvAqB70lmeDbB+lDN4ZBoy44d2JCuh
         29b8praBgh2EPf/LbbNX2SjCgXCgy91hT1UcFWibT8PHkdAVY5OGC936ZxI/+T3isTpZ
         mwStD+snRIJTVKGa3bt6j1JZhwQ1Tn+ucJZF32l98h4kZVlQuKqmVRDNEJOL8MGLCZG4
         mcqWXEBJp20kr5/XkwHq19lhnran/DaYMGtbEP+LWq+qZY2YXiQLIMlmSi9qAUrm1AA8
         Za51tMZNmgKezd97k6Q8dKxH1ef/PKz/T1K1PpomrHQ8MygArdXHzEbI5Nhnx7J5fxoV
         N2wQ==
X-Gm-Message-State: AGi0PubqEx5IISEuPUzmnEcKyBqFEN+++hl3sdfUzyNBoV8JOj7265C/
        focYQCxzl0LlzxQkmMh8wW4=
X-Google-Smtp-Source: APiQypJRc8wOoBDcr/uA7N10LPKvToP2KsFPX3vRczpev6Q+ZDIOfu+L4z0fWM+ElzPSZ9JJfCaBFQ==
X-Received: by 2002:a63:5d24:: with SMTP id r36mr17045870pgb.426.1589235555905;
        Mon, 11 May 2020 15:19:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id i25sm9875509pfo.196.2020.05.11.15.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 15:19:15 -0700 (PDT)
Date:   Mon, 11 May 2020 15:19:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v11 04/56] Input: atmel_mxt_ts - split large i2c
 transfers into blocks
Message-ID: <20200511221913.GY89269@dtor-ws>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-5-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508055656.96389-5-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada, Nick,

On Thu, May 07, 2020 at 10:56:04PM -0700, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> On some firmware variants, the size of the info block exceeds what can
> be read in a single transfer.

Is this limitation of the mXT controller or maybe it is issue with
implementation of the particular i2c adapter and should be dealt with
there?

Thanks.

-- 
Dmitry
