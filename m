Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23AC65F0F02
	for <lists+linux-input@lfdr.de>; Fri, 30 Sep 2022 17:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiI3PiJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 11:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiI3PiI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 11:38:08 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848FD197F3A;
        Fri, 30 Sep 2022 08:38:07 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c24so4298758plo.3;
        Fri, 30 Sep 2022 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=B9/BMzQkCVFD03IIXzu2Mepnbrb2G4V1ssG+c2c8kdU=;
        b=VHXKvIkCj7AB7fCzr3ersBMhBT2zfqoIH1V9rg+oWAXaG7VMpwqDWIx0n3r3gyUep2
         3S+pFH0zHGyCn1yfErvHgPZo57bEfK7VmCTp1n5qv3iLqMK7cPnzjc+YUPeHx5MmCMzi
         CPh+E9oi1lwc0KCiNUHnBKT2JqXsk84AFHU30aUE8Pkaf8flZbpAX6tXoluZg4YkG9kz
         K0kvCd+zlBRWjZneag5LYBh0E7U3jgKI+TXTLy6zdzyNWRmBRRpDI/3nAIiLNrCUiIzj
         GiLtWsPex8QdeYAVGsZrlccrt4OX3w8XpMwf21X4tt4A4V4CZe1u6ntRiJZkaYqaJLl9
         p3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=B9/BMzQkCVFD03IIXzu2Mepnbrb2G4V1ssG+c2c8kdU=;
        b=rYLZr3HnRuNedIdzSizR0AAKAStwvB+A3JRAxdAmGmbsMgF+sNaLsUwJbDubsUIpqD
         YjeEUWuwPh9I/PELl0nf21mSP3ofWdOxTDFGXaDhBGllAEYHcw22GfqzyLJ5ma2D8oFC
         KHd4UfnSxKBtrXQEQaDoaDVaY5NOT/PUe5EV+H19SCmCfBt+8qnQK0U43h9exPH0/1ZY
         zP32ZEtJ6oHqz3iUNyWRT83QukE6UH+/byh8zZ+Ni5urZa/bKAtuCeuIfVGb+G+Gbpsi
         yebn+r/6T/NUPQ4I+dXO8Roh2w0op4Te8eQSsTq3U1duwa2dOFeS6UMuO5fEZHFSyyAj
         Najg==
X-Gm-Message-State: ACrzQf3OOL8DD/FcsvI7eQxgHyGAQTF5RJj8ZE4TGEclMNMduxi2+jYp
        N3JChubam7ydWU5ggsAsQwU=
X-Google-Smtp-Source: AMsMyM7g1/dT96J0oQmbrOILhBF7Fz0kQLdrrer9miIus4tOiG3FG4Wgv3LoyF8qZdlhhr7Ukmi0fA==
X-Received: by 2002:a17:902:d490:b0:177:fc1d:6b0c with SMTP id c16-20020a170902d49000b00177fc1d6b0cmr9533294plg.28.1664552286800;
        Fri, 30 Sep 2022 08:38:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d016:f5be:4ff2:43f])
        by smtp.gmail.com with ESMTPSA id u68-20020a627947000000b0053e8368ec34sm1986876pfc.32.2022.09.30.08.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 08:38:06 -0700 (PDT)
Date:   Fri, 30 Sep 2022 08:38:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <YzcNW/ZVV/KMqpds@google.com>
References: <20220928214806.13572-1-macroalpha82@gmail.com>
 <20220928214806.13572-4-macroalpha82@gmail.com>
 <YzXGu1YeelH5CGFn@google.com>
 <SN6PR06MB5342901F1E899851B6D9670CA5569@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342901F1E899851B6D9670CA5569@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 30, 2022 at 10:34:50AM -0500, Chris Morgan wrote:
> On Thu, Sep 29, 2022 at 09:24:27AM -0700, Dmitry Torokhov wrote:
> > Hi Chris,
> > 
> > On Wed, Sep 28, 2022 at 04:48:06PM -0500, Chris Morgan wrote:
> > > +
> > > +	/*
> > > +	 * Testing suggests command is required to allow reading of
> > > +	 * firmware registers.
> > > +	 */
> > > +	buf[0] = 0xd1;
> > > +	buf[1] = 0x01;
> > 
> > I wonder if we can define some symbolic names for these.
> > 
> 
> I don't know what they mean, the best I can do is guess. No
> datasheet sadly. I know from preliminary testing if I don't
> send this initial command here the rest of them fail, so I
> assume this command allows me to read certain registers?

Guessing is fine, we can adjust them if we ever get a hold of the data
sheet.

Thanks.

-- 
Dmitry
