Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40557A462E
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 22:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfHaUWE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Aug 2019 16:22:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44003 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbfHaUWD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Aug 2019 16:22:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id u72so1063409pgb.10
        for <linux-input@vger.kernel.org>; Sat, 31 Aug 2019 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p1P8Tg/RR2N1rMMw18dVry1N4vh3oLnhVt0VTAL8OWg=;
        b=t2okGDoba7wWqiU2srnDjQVRd6MkcWFe6oYdlfMGGC5xieC/LFSBgDbhXOxp/+yyoL
         2rgkAdjn3Q5R9TVHqADXa983S/2ltmibGhDz9ruTCRbTh1CT85JzlcE8waE4W33Bg1Pz
         GdJDWoq4vj43KDk4pLPYM2GTV5L+DHir9fIw8X4CvetFTxPY8UpqMwZ3Fp0MRFu8xfga
         anG61uqgmpEsJdO1bjGo2KCd+TPAUGeprfyeQEGViFfMLNDLKkHH7y4O9ZAbURuo75qF
         Zh0ScVelfqVumQepK4+HdY1bhd/s3sGolV2qMTY26qW85RoGZPFSlwiuC26EygvyxnWG
         5djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p1P8Tg/RR2N1rMMw18dVry1N4vh3oLnhVt0VTAL8OWg=;
        b=lSW+Busjta2HXr5IVCVQCXT7xHZ3eWrei2kKZ/NAUj7SYIFIzuuerxGca1A1619HKG
         WVCJO4+bhEP2onAUuMGjDDtEO12Pv4pmSxabCAfqAgemcPRhnqbFfN/lmmaVWbU++QM8
         y1OYQ1rffawbWzmg3NhsMaiQ32Mx8KEY8cwD6oGzvRQE5/Lk23MG03NOEDG6jKSsKVNa
         0GL41fKCbTO/G39DZDWz5iRlvb+3Bbj11wG2/8tJOWKL+3VZuo6V2YBDnS0ag31ulZhl
         wTYrKJnlo1amk2DnqBdQs/VZOba1yJxGCS4azRVd5gshVi4mJbPyyH76RmPssRz3MBnu
         cVag==
X-Gm-Message-State: APjAAAUa3Y23pnujbIRQRW8czP1LySIaB0yxOA+oZg99EM80/kIiNrj9
        o2VEDbIGvzpG4ZCMGR7KxNs=
X-Google-Smtp-Source: APXvYqyfV8pCQN0zJCMzts0TDDGWLOlsQst+K+2G9DSfahGKxAk/QHf7oqgrCK0kUSUSNkYA9KLAlQ==
X-Received: by 2002:a63:9e56:: with SMTP id r22mr18489338pgo.221.1567282922763;
        Sat, 31 Aug 2019 13:22:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v8sm6411948pje.6.2019.08.31.13.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2019 13:22:01 -0700 (PDT)
Date:   Sat, 31 Aug 2019 13:21:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/7] Input: Add event-codes for macro keys found on
 various keyboards
Message-ID: <20190831202159.GG187474@dtor-ws>
References: <20190828124130.26752-1-hdegoede@redhat.com>
 <20190829175151.GB187474@dtor-ws>
 <c7957ff6-bae5-c577-7744-4daf7fc35600@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7957ff6-bae5-c577-7744-4daf7fc35600@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 31, 2019 at 12:27:11PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 29-08-19 19:51, Dmitry Torokhov wrote:
> > On Wed, Aug 28, 2019 at 02:41:24PM +0200, Hans de Goede wrote:
> 
> <snip>
> 
> > > This commit adds the following new KEY_ defines for this:
> > > 
> > > KEY_MACRO1 - KEY_MACRO30. KEY_MACRO_RECORD_START/-STOP,
> > > KEY_MACRO_PRESET_CYCLE, KEY_MACRO_PRESET1 - KEY_MACRO_PRESET3,
> > > KEY_KBD_LCD_MENU1 - KEY_KBD_LCD_MENU5.
> > > 
> > > The defines leave room for adding some more LCD-menu, preset or macro keys,
> > > the maximum values above are based on the maximum values to support all
> > > currently known internet, office and gaming keyboards.
> > > 
> > > BugLink: https://github.com/libratbag/libratbag/issues/172
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Thank you, does this mean that you are ok with merging this through the
> hid tree as part of the rest of the series ?

Yes, please feel free to merge though HID.

-- 
Dmitry
