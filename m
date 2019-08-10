Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 506A788CD6
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 21:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHJTFR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Aug 2019 15:05:17 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44504 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfHJTFR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Aug 2019 15:05:17 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so46257995plr.11
        for <linux-input@vger.kernel.org>; Sat, 10 Aug 2019 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d9ecudACINsSBGe6VSdjfxROcWscsEtnh98quYGYMj0=;
        b=Shj9W96FYPrHqMI4evUf0OT1BPnVwplIfedy9Rk5zp6TKNTb2f2CVl2n1D7CK1bt//
         00AkrJloGWNqvWhzJKnA/R7lCEL1wMWVDDO6jWf2MttxrzrTCYgy1bgFCJOxtKxB2XKV
         0Dzu8VjFpnBrsN1kbBk8UaiTeHhD1jkPFPnv3gqCCDzE+7MzYt8uH3MfWRCdmamp+5zn
         t6DHIxjT4Mo7LO3NkoDSLr98Xajppjhw+TxEHVKF98Pg5mWCnE6ZxanIXJo6Hsn6okgF
         C44Eta83wBpErLV4qSA/4V0r5d8dvJIY+YFb5taoHkZwYHrLWoVuDnVepjveja4x6+/n
         lDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d9ecudACINsSBGe6VSdjfxROcWscsEtnh98quYGYMj0=;
        b=Dy46FvimCqUaHD4uq3VDni0BDx2NBsmU0EsOHQ1O/q/HFbSq/BkD/I7nQt4k5UsAi8
         BARZUbLPqG4zgm9M9Lbxi6oc38WcRqN1RG+SrOdv3/f1em2MioueLS1FzKsV7KRSC0Zk
         IEb1LXjOPO9v4Hl/dOFHuz4iadByVgV2Sj7ANdOkG/f1+GIOlGJtE9Mnrn9X+QrwXjdM
         Nb6Z3/M+lp+H5XQvmtqx4VLhBZR1TFw3+lCZfJQlZs4fSXB4gCEcWEVGh5IMtbX+8C6F
         5Soqd2PKs6UE32i2wPX0igtT7pLuAO2G5aBzgKIQrtcWpu274y5iCx6T/lpwVojeF2RK
         6lUw==
X-Gm-Message-State: APjAAAUBDkMW6MDXP5nIdbwFi4ECNztRoSCHA2FX69HHKa8HrDWT1iHL
        IZ+21gpqL6mgy0RGuEj4TgY=
X-Google-Smtp-Source: APXvYqzWt9UI4vw7ChkwVCtcJl5JSoSxjH7G2FHSI0DFww3Ap2CKTtEfc4Qd3rztjV0iKBdDwIbtww==
X-Received: by 2002:a17:902:a508:: with SMTP id s8mr1938353plq.280.1565463916516;
        Sat, 10 Aug 2019 12:05:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d6sm88318218pgf.55.2019.08.10.12.05.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 10 Aug 2019 12:05:15 -0700 (PDT)
Date:   Sat, 10 Aug 2019 12:05:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20190810190513.GS178933@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20190302141704.32547-2-marex@denx.de>
 <20190810164137.GQ178933@dtor-ws>
 <27428362-1bfc-de9a-da19-c47a9d483e9e@denx.de>
 <20190810174447.GR178933@dtor-ws>
 <4c284f45-fd6f-4bc1-bf58-ea9ae8c601bf@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c284f45-fd6f-4bc1-bf58-ea9ae8c601bf@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 10, 2019 at 08:00:14PM +0200, Marek Vasut wrote:
> On 8/10/19 7:44 PM, Dmitry Torokhov wrote:
> > On Sat, Aug 10, 2019 at 06:50:08PM +0200, Marek Vasut wrote:
> >> On 8/10/19 6:41 PM, Dmitry Torokhov wrote:
> >>> Hi Marek,
> >>
> >> Hi,
> >>
> >>> On Sat, Mar 02, 2019 at 03:17:04PM +0100, Marek Vasut wrote:
> >>>> Add support for ILI2117 touch controller. This controller is similar
> >>>> to the ILI210x and ILI251x, except for the following differences:
> >>>> - Reading out of touch data must happen at most 300 mS after the
> >>>>   interrupt line was asserted. No command must be sent, the data
> >>>>   are returned upon pure I2C read of 43 bytes long.
> >>>> - Supports 10 simultaneous touch inputs.
> >>>> - Touch data format is slightly different.
> >>>
> >>> So with this and also I see there is another ili2117a submission, I do
> >>> believe that we need to switch to using function pointers instead of
> >>> if/else if/else style cheking of the model.
> >>
> >> How about we add tested functionality in first and only then do bigger
> >> untested changes ? I think that would work better for everyone.
> > 
> > Sorry, I would really prefer to do what is right and build additional
> > functionality on top of the good foundation. I asked to switch to the
> > function pointers before, but you did not want to citing performance
> > (even though we are using function pointers everywhere in the kernel),
> > now I gave a draft implementation, I hope you can use it.
> 
> So why can't we add tested code in first and then add new huge untested
> patch on top and start testing it ? I think doing it in reverse is
> actually not helpful, if there is a problem in this massive new patch,
> it could be reverted without losing functionality.

We still have 4 weeks till merge window + stabilization time past it.

Thanks.

-- 
Dmitry
