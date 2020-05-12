Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A19F1CE995
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 02:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgELAWq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 20:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725855AbgELAWq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 20:22:46 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A272C061A0C
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 17:22:46 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id g16so8932415qtp.11
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 17:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=75ESysuaXCFqlYtlQQCwhJFASgmRgFadMFY88l0OGh8=;
        b=KN/7TgHKQuTYykbN/5M4z0q+GJVsUiARLdsh63EPlMHKaC66XMTXpuhACNNBRZOTgE
         iXiJme1+EYQJ3JVpMAMGYv1BnBAoChaapM+kwcEK9wUDMSPzt6tAIRNDRgFAWnsaJU8s
         h/s9ThaztlbcnthXocpdHMaOwrsAwYwRb6QID8PduGKhID/OGGbiQe45fH3XOZXs85yV
         Rh6qUeN7DaEfg5pAhcZMgr9ytcU8MNeVS7kq1by4MT2bHNCDDaaIeFJQ9cAJVUj+zCvz
         Xf04p1la4f/YsU9f0KzovCgT42tk40qb+hP5ZKXzF6yMxpdizjxWJnTsf6fjlljrfLYv
         N31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=75ESysuaXCFqlYtlQQCwhJFASgmRgFadMFY88l0OGh8=;
        b=XCIGXZKzzmHcy6P1xfHZ+/mEXwHOPgW8/0PLSsZ+N/IXfIfiXTePbtnasVPhpLegbK
         9GVAFuMwHxVdhMvuK9gPsiSjLWKP+Lc3OGawb3kfGtSNg9dTUCSaaDUzHYo7GyofWeg2
         sQGUxW4kTJjAeK/S5FtYfPFgCpTBbO9+IjHtZUAgWTSqQaQM3JG+8xMHtpX/dkomwSE5
         +xM7Jsz473mY4lxhw8aBDz/yDEEcjpqO5WKKYsIJbqfxDSF65D7elytxhNKhneADp3oX
         mEGDceqZdK7ZMYxmhuoKjcg7KjjBmzlob2KFRzeCaGgCM7gOKSiTkvCqIfsx8BQetdXo
         2fwQ==
X-Gm-Message-State: AGi0PuZ446KKPhb0OuE63DZTkC1h2NBl0zKUrTiGNtTCqSONTbpcnD7R
        t2lr/wOIFDuc5ypiK1+ZN5xnkn3S
X-Google-Smtp-Source: APiQypKjCQqYfFBQVX1MnLOjOsJvAMFF2chaKhSehbRFZ4X1o6+9VfVsH1faSKiHGwkdzck7go2/7g==
X-Received: by 2002:ac8:6c6:: with SMTP id j6mr19201585qth.194.1589242965003;
        Mon, 11 May 2020 17:22:45 -0700 (PDT)
Received: from ?IPv6:2605:a601:53d0:120:b89d:bda0:a559:80d4? ([2605:a601:53d0:120:b89d:bda0:a559:80d4])
        by smtp.googlemail.com with ESMTPSA id q62sm9770373qke.22.2020.05.11.17.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 17:22:44 -0700 (PDT)
Subject: Re: [PATCH 1/3] HID: gamecube-adapter: add nintendo gamecube adapter
To:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20200506004801.9478-1-fx.carton91@gmail.com>
 <21978190912689256db8cc547a25313559e94019.camel@hadess.net>
 <0e4f2671-00e8-b5d3-f309-8355bc92f118@gmail.com>
 <20200511231806.GA31481@pc-fx>
From:   Ethan Lee <flibitijibibo@gmail.com>
Message-ID: <bc392ac3-f70c-be0c-c7f2-a6f69279152b@gmail.com>
Date:   Mon, 11 May 2020 20:22:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511231806.GA31481@pc-fx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Oh good, that hidapi char should indeed prevent any conflicts - forgot 
that Sam had that in there. Once this driver is merged we can add a new 
entry to the database right away.

The way the gamepad system works in SDL is that there is SDL_Joystick, 
which provides direct access to devices, and SDL_GameController, which 
tries to take known hardware from SDL_Joystick and maps them to an 
Xbox-style button layout. For us it's generally considered okay for 
joysticks to not follow any standards, since you typically only access 
them for very specific kinds of devices (flight sim controllers, stuff 
like that) and those developers will often want their data as untouched 
as humanly possible, while most game developers will only touch 
SDL_GameController, which wrangles all the quirks of each device and the 
specifics won't matter as much.

-Ethan

On 5/11/20 19:23, François-Xavier Carton wrote:
> On Mon, May 11, 2020 at 10:09:28AM -0400, Ethan Lee wrote:
>> Looks just like the SDL hidapi driver so this should be okay! The only
>> thing I'm unsure of is the axis inversion, in SDL we read the axes
>> directly and invert them in the SDL_GameController configuration.
>> Someone also added a bunch of dead zone work after I wrote the driver,
>> but unfortunately I don't know the details of that.
>>
>> The meat of our driver is here...
>>
>> https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/hidapi/SDL_hidapi_gamecube.c#l226
>>
> Thanks for the review and pointer to the SDL driver! I think the dead
> zone min/max code is a better way to solve the dead zone issue than what
> I did in the 3rd commit, as it is an automated solution. I'll implement
> something like this.
>
>> ... and the SDL_GameController config is here:
>>
>> https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/SDL_gamecontrollerdb.h#l614
>>
>> The '~' char denotes an input value that is flipped after it is read
>> from the joystick; the vendor/product/version matchup may cause this
>> config to accidentally flip the axes twice when using the kernel driver.
>>
> I tested this on my system and the axes are not getting inverted twice.
> This is because the version component of the GUID doesn't match the one
> in the db file. The db file has 00016800, whereas "sdl2-jstest --list"
> reports 10010000 for my gamepad. Because the GUIDs don't match, the axes
> are correct in sdl2-jstest. If I add an entry with my gamepad's GUID,
> then the axes are indeed inverted twice.
>
> I don't know why the first part is different (0001 != 1001), but the
> second part is different because the SDL hidapi driver adds an 'h'
> (0x68) to indicate that it's a hidapi device. See:
>
> https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/hidapi/SDL_hidapijoystick.c#l712
>
> So as long as this code is here, the entry in the db file won't get
> picked up if the kernel driver is used.
>
> Also, I don't know much about SDL, but looking at sdl2-jstest, it seems
> that there are two APIs: joysticks and gamepads. If the db file is only
> used for the gamepad API, that means that the axes won't get inverted in
> the joystick API if using the SDL hidapi driver. Is that the intended
> behaviour?
>
> -François-Xavier


