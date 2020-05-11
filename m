Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473A91CE908
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 01:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgEKXVp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 19:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725836AbgEKXVo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 19:21:44 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2C3C061A0C
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 16:21:44 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id h26so9587515qtu.8
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3hK6CAuLEOHDWmiVHAQ6fHCBZredq15+zUOjj+CYvJE=;
        b=WhMCyDrb7hutM8vKnZ/3EGQgjhWZxO743PTitrAx6A4GqTL2litSArQu4gPkbtGppt
         ZOJacziZkRgNDaj2oEYcL+d1w81HGJanaCIRLRUZ1dXgAORDdkMPfuuq3ASpseQT/w/H
         vzjTJ+A5zt5pTDugvscIFJglqOZGow4bhc765qiNf/y6YP6oEbEzTriSc6zNaPIOWd43
         lkjyCD1g2c/PaH3sfeJvzOfuOa9Jv27Di7wYXGZGLVIBW+yNqI+8VMkeE9xhxwEEaF/8
         ZRcgQg9GmlMKWTesdy0hv3BhgYiiVtlHzYbYE2oYAxcmqnE1yETMyju4L+BAWW5fD0yK
         NWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=3hK6CAuLEOHDWmiVHAQ6fHCBZredq15+zUOjj+CYvJE=;
        b=O+tWqrHtiKVUVJTrYtaApAGVD7PMje2m0Gmx7/IC9Y3gOktCzzPxeq6olrrE5uI1WG
         IlkEpbRDuyj6sb4L7sN3MhMa6n9uJXrVLl7HgXoFSQHG3nlKPi4pOUdEpHK2Z89yXp36
         MQ2+1JT9GdmwXNWgDG/DIF7GZAMLYBT5cV+XGAufmdWqvsIIkSdglL/NfOsskzQl4F99
         3sINBaXTD25bmV8IhLINUQ2mKwXLjHLIF6xoNI7tiamRYVL21TEnBUjldukq5UNJYg4c
         l9aM8pSk9D32O837T7kv52uKzy16FMVknOb9lbETKAcS1w9hJDQUq4H6njXBaM9aVht3
         G1OQ==
X-Gm-Message-State: AGi0PubQe+q2fzd9ekwsqtnADJ+Q9syijjlFzsEr+4NnpFiLvujtCTlv
        hlbREHfOQFWRNPvCtGrnkXw=
X-Google-Smtp-Source: APiQypIKLY+B+3g5yVaHa53lIiw+gbcUiac+dMRCpMgdwfCyLe6cnZJstWowuASi2xRpTNc9IcZJ8Q==
X-Received: by 2002:ac8:4cdc:: with SMTP id l28mr7759183qtv.213.1589239303755;
        Mon, 11 May 2020 16:21:43 -0700 (PDT)
Received: from localhost ([2601:483:4200:9113:fdae:121b:56a3:4870])
        by smtp.gmail.com with ESMTPSA id k2sm10337924qte.16.2020.05.11.16.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:21:43 -0700 (PDT)
Date:   Tue, 12 May 2020 01:23:31 +0200
From:   =?utf-8?Q?Fran=C3=A7ois-Xavier?= Carton <fx.carton91@gmail.com>
To:     Ethan Lee <flibitijibibo@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        =?utf-8?Q?Fran=C3=A7ois-Xavier?= Carton <fx.carton91@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] HID: gamecube-adapter: add nintendo gamecube adapter
Message-ID: <20200511231806.GA31481@pc-fx>
Mail-Followup-To: Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20200506004801.9478-1-fx.carton91@gmail.com>
 <21978190912689256db8cc547a25313559e94019.camel@hadess.net>
 <0e4f2671-00e8-b5d3-f309-8355bc92f118@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e4f2671-00e8-b5d3-f309-8355bc92f118@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 11, 2020 at 10:09:28AM -0400, Ethan Lee wrote:
> Looks just like the SDL hidapi driver so this should be okay! The only 
> thing I'm unsure of is the axis inversion, in SDL we read the axes 
> directly and invert them in the SDL_GameController configuration. 
> Someone also added a bunch of dead zone work after I wrote the driver, 
> but unfortunately I don't know the details of that.
> 
> The meat of our driver is here...
> 
> https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/hidapi/SDL_hidapi_gamecube.c#l226
> 

Thanks for the review and pointer to the SDL driver! I think the dead
zone min/max code is a better way to solve the dead zone issue than what
I did in the 3rd commit, as it is an automated solution. I'll implement
something like this.

> ... and the SDL_GameController config is here:
> 
> https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/SDL_gamecontrollerdb.h#l614
> 
> The '~' char denotes an input value that is flipped after it is read 
> from the joystick; the vendor/product/version matchup may cause this 
> config to accidentally flip the axes twice when using the kernel driver.
> 

I tested this on my system and the axes are not getting inverted twice.
This is because the version component of the GUID doesn't match the one
in the db file. The db file has 00016800, whereas "sdl2-jstest --list"
reports 10010000 for my gamepad. Because the GUIDs don't match, the axes
are correct in sdl2-jstest. If I add an entry with my gamepad's GUID,
then the axes are indeed inverted twice.

I don't know why the first part is different (0001 != 1001), but the
second part is different because the SDL hidapi driver adds an 'h'
(0x68) to indicate that it's a hidapi device. See:

https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/hidapi/SDL_hidapijoystick.c#l712

So as long as this code is here, the entry in the db file won't get
picked up if the kernel driver is used.

Also, I don't know much about SDL, but looking at sdl2-jstest, it seems
that there are two APIs: joysticks and gamepads. If the db file is only
used for the gamepad API, that means that the axes won't get inverted in
the joystick API if using the SDL hidapi driver. Is that the intended
behaviour?

-François-Xavier
