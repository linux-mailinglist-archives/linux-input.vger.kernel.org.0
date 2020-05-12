Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAA71CEABC
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 04:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgELC0S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 22:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgELC0S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 22:26:18 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83416C061A0C
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 19:26:16 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id g185so12140721qke.7
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 19:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=r892S3LvnhZv7OlXzb5d08FDZxUCIzqhavugSa6xyrQ=;
        b=uj+czC/qK5cqDMKBQAe5VeZqEAB4sF/kGNaCZufsp4OQIdposLCqFixIjHPPWHhreP
         h4rKZZMaPP5O4TVNIhZxFquIBfTGmbd3Sx1CvCkRsT4dmezccxiPrI2k6bzlwrAsLpWP
         I78KFkfNDWynwYSc6/bTKjPOz6NUpuPY3Ol0Nhlkqplk6TFehcyurd6CrWZffOQJWA0E
         Jo/q9e3+bJwOxFBIfn2XHKVG8++uKlwkG+hsgCbo8dMyjQ1i8Kplku9jvg7jfNqv3atH
         f6951cehjIIMEb8CTiNcFnUGITs2w+yjREfaAnFUBVUsA6wA9T99yS1bct1Sb5e39/ae
         G5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=r892S3LvnhZv7OlXzb5d08FDZxUCIzqhavugSa6xyrQ=;
        b=gQi4NkTFUjf+TPnK+RdfCuX4OsIk9BYWE6f5O6n0S97je4HL7bmMIg7l14GfybqnL2
         14hfxsvxccis+Wb1u/8aYchMmdz0SiH00pChApjmaF/zEg/Do9YDcbBZDWyIEVF9wHib
         teDcw1mhvaycPXX2nZqQ3eemE2eJ4scurA1xygN6U42EbidGMbbRyTs+Xcd2fhYyRTbi
         THdDp7pvv6tX9nDXRy6D8tqwFsyZfIZjk+S2yPVy2R6l7gkRWp984Ph41rwOxo15VNS4
         B8JukgNUPwv/tDbwHKMdHHUA3zNoLYS/m+ZtbxcSgbOF1itl09tMIFbZxfaQY+CfI/1k
         h6UQ==
X-Gm-Message-State: AGi0Pubfi7JomuMk0rJ7u6SzEN/8qCprARnHFpmlWazpaBYMj66oasd5
        afSnILJVi6ORjufcRufilFQ=
X-Google-Smtp-Source: APiQypI9PFyLQ6KEbwG/Vs92tBFJVy6oOwx6iWXIPS0wYmnZ9siw2qugvy0Ar4OyN1389vR26g1ixA==
X-Received: by 2002:a37:5c46:: with SMTP id q67mr18453251qkb.210.1589250375705;
        Mon, 11 May 2020 19:26:15 -0700 (PDT)
Received: from localhost ([2601:483:4200:9113:fdae:121b:56a3:4870])
        by smtp.gmail.com with ESMTPSA id s74sm9890856qka.54.2020.05.11.19.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 19:26:15 -0700 (PDT)
Date:   Tue, 12 May 2020 04:27:57 +0200
From:   =?utf-8?Q?Fran=C3=A7ois-Xavier?= Carton <fx.carton91@gmail.com>
To:     Ethan Lee <flibitijibibo@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] HID: gamecube-adapter: add nintendo gamecube adapter
Message-ID: <20200512022757.GA11974@pc-fx>
Mail-Followup-To: Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20200506004801.9478-1-fx.carton91@gmail.com>
 <21978190912689256db8cc547a25313559e94019.camel@hadess.net>
 <0e4f2671-00e8-b5d3-f309-8355bc92f118@gmail.com>
 <20200511231806.GA31481@pc-fx>
 <bc392ac3-f70c-be0c-c7f2-a6f69279152b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc392ac3-f70c-be0c-c7f2-a6f69279152b@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I see, that makes sense.


On Mon, May 11, 2020 at 08:22:44PM -0400, Ethan Lee wrote:
> Oh good, that hidapi char should indeed prevent any conflicts - forgot 
> that Sam had that in there. Once this driver is merged we can add a new 
> entry to the database right away.
> 
> The way the gamepad system works in SDL is that there is SDL_Joystick, 
> which provides direct access to devices, and SDL_GameController, which 
> tries to take known hardware from SDL_Joystick and maps them to an 
> Xbox-style button layout. For us it's generally considered okay for 
> joysticks to not follow any standards, since you typically only access 
> them for very specific kinds of devices (flight sim controllers, stuff 
> like that) and those developers will often want their data as untouched 
> as humanly possible, while most game developers will only touch 
> SDL_GameController, which wrangles all the quirks of each device and the 
> specifics won't matter as much.
> 
> -Ethan
