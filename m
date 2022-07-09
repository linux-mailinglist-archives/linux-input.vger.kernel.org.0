Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4537556C6F9
	for <lists+linux-input@lfdr.de>; Sat,  9 Jul 2022 06:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiGIEu1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Jul 2022 00:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGIEu1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Jul 2022 00:50:27 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625897E813
        for <linux-input@vger.kernel.org>; Fri,  8 Jul 2022 21:50:26 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id e16so638045pfm.11
        for <linux-input@vger.kernel.org>; Fri, 08 Jul 2022 21:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6TCbWLLtmcojvBYO9H7MJUmDFhAo4ymbaHEyQHBGnoQ=;
        b=qT3uW/OX3E4isIp3QUUSgnvO3K/026+sulGR0egm81KNB0wOPxWDTSHqnc6DWvJDhW
         fXv0MIcanL89bux2bFkFmS7yOqjJzaEZw2gCSBO3JWPSLHO81SfyMkawpx/JoLndDeNY
         ktyd/izvxs4t8qlRP7Ul+kLjv3jOuWZgfyyIVLD/vRSULeujJ3KvVJ82lfDxl4nCxRcV
         cr16nWsl9mJVGtE4f2ASJJQnEEL8OMEeIIAzPS5BUGqGbajl47rDSTM6Vch8BbMDFBJX
         jJycKUuN8AoDPxKCdLDDPexQ9VD2d2/S34tAi7WzeFD9vfytooxO/aJ/Vf4e51/cA36i
         C6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6TCbWLLtmcojvBYO9H7MJUmDFhAo4ymbaHEyQHBGnoQ=;
        b=wdhA9iIrtXEbVniyDBHR/cXvazjVrED4dqYyqLeBxSYYqMv64SjYjV07eopORk2Dwg
         YgDhCjt7StyYu8awzU/8P9ibKXxkG294OQAlGuyGRdR6BedFcBR2oJbXjDZTFsd6fQoE
         d38A6hHTjOwtnUBNqSlqx6QUOMkI/l5g1rzqvYS90gYKlMk9NHVmAZiZh1i+VvpBb5Uc
         AKoNjSajH2K3CzffAwf94d+wgNbRPdKXay5poTwvDfJQyFYX5Py84aB9D3DJZ0gGlN87
         JWJUIF/Py6/1xr8icVOIFS1vBdvjB1E8HLrhasO+i9zoFApWc0mT2T9koUAqI32wxjUd
         qlTA==
X-Gm-Message-State: AJIora9Wr8VthebldlGTYO1kdKdCXZ6Dv5PSvPqL8f2YARZnQgtzEJXa
        otC8ITIEmLU3eykR7S2SVmyOydW5Io0=
X-Google-Smtp-Source: AGRyM1uEtFgdqfR0/ayvwrOHJZQaHd4Cbqsw3e9pfcA8WE3pusHFZ3gBXHXmQyhfKIqhlXy1IQM1iA==
X-Received: by 2002:a05:6a00:1a8b:b0:525:9c4f:ade5 with SMTP id e11-20020a056a001a8b00b005259c4fade5mr7502205pfv.74.1657342225832;
        Fri, 08 Jul 2022 21:50:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5011:9ea9:1cc2:a4c0])
        by smtp.gmail.com with ESMTPSA id w125-20020a628283000000b00528676a46cbsm441286pfd.194.2022.07.08.21.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 21:50:24 -0700 (PDT)
Date:   Fri, 8 Jul 2022 21:50:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH] input/i8042: Add dritek quirk for Acer Aspire One AO532
Message-ID: <YskJDh9qCWZmAXAy@google.com>
References: <20220418200949.6009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418200949.6009-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 18, 2022 at 10:09:49PM +0200, Hans de Goede wrote:
> Like on other Acer devices, the wifi, bluetooth and touchpad on/off toggle
> hotkeys on the Acer AO532 do not send any events when the dritek extensions
> are not enabled.
> 
> Add a quirk to enable the dritek extensions on this netbook model.
> 
> Cc: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
