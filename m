Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12F23B935B
	for <lists+linux-input@lfdr.de>; Thu,  1 Jul 2021 16:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhGAObn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Jul 2021 10:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20462 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231698AbhGAObn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 1 Jul 2021 10:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625149752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SYSR+DGXj4dB5AnICjCd03ccDF2w3Uf502xeGyEKyTo=;
        b=CekVU7inpQtclNihjm02+stnIcdm1ymRmddK9yQpD2L5KajOFFaoV4X1r5pXNKDmTo3ICp
        Y267OmPCSa/hChdKCgGjaDjUJ3yy/GH1hxS41brIAYTgCCPVKp3hZbw08ncNHgFLTffhu8
        B3vIVse5MdrtY+xZGzWvqvGHuLfm3W4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-6Ox_i-ggNFKwJqxYn8uY1A-1; Thu, 01 Jul 2021 10:29:11 -0400
X-MC-Unique: 6Ox_i-ggNFKwJqxYn8uY1A-1
Received: by mail-ej1-f72.google.com with SMTP id de48-20020a1709069bf0b029048ae3ebecabso2154884ejc.16
        for <linux-input@vger.kernel.org>; Thu, 01 Jul 2021 07:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SYSR+DGXj4dB5AnICjCd03ccDF2w3Uf502xeGyEKyTo=;
        b=IuCre84xFOQZREoMz4FTeXqTqrNPl7PmHJn+8cB386b6Hlq8wSnWWWtsi5lRlbtdxK
         XQYWRW78WjK9S3982L9t7rejZVTy7I9JnQvlEqu1thXsr7WMK0nT+RfqvnxfQeGjmpsl
         32VEH8ZqftFu0bUzAf0S5nRhwyfNzgg8tcXl28wLIGOlv9y551atX/RutK1TumK5BqZd
         FApT193me3iyhAcoqHypYzw7nw1s3PYBk/bQ+/S5UaCwFmGLzqxviLRi1Ieyv5ZBYkt6
         AeUIq2xeRQxyiIFRU9NlhWWC9ggs9Kuwka5fehXMkrlWjgCEkfKN6q7GMqpbdXQlvxo2
         OzSg==
X-Gm-Message-State: AOAM533/tc9iYaYqFxyEatGPCJ+bkyHJm9lVdkfp7Eq5uGrSCUXvdEft
        FhhSOHtXYEqRhvD7WYvLB/28lsmPN5cwzygjepqXdJfU5dyJWH3GlROtCyz0EaHtSFU4xGE279x
        SM3qOZAKxzaxeSdp1c90kgk6iStUarH/gGpdTdUhU4tlhaGQO7HrctwbET9c0pL75Vu1mw0ns6d
        A=
X-Received: by 2002:a17:906:c1d0:: with SMTP id bw16mr149624ejb.146.1625149749726;
        Thu, 01 Jul 2021 07:29:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdI8sH5musWyQETXOq8AKETAR+7Vc1ZbexFI4D+gHhMRbQrdxFglJuXSHeq6Vk8WutsY6Gbw==
X-Received: by 2002:a17:906:c1d0:: with SMTP id bw16mr149601ejb.146.1625149749501;
        Thu, 01 Jul 2021 07:29:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jy6sm361ejc.21.2021.07.01.07.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 07:29:09 -0700 (PDT)
Subject: Re: [PATCH 0/7] Input: goodix - Add support for controllers without
 flash
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org
References: <20210428114608.101795-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <04b72c55-8122-73b2-a37a-271a510db2e1@redhat.com>
Date:   Thu, 1 Jul 2021 16:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210428114608.101795-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/28/21 1:46 PM, Hans de Goede wrote:
> Hi All,
> 
> A while ago I bought a Glavey TM800A550L tablet. This is a Bay Trail (x86)
> tablet which comes with Android from the factory.
> 
> It is mostly just another Bay Trail tablet, but the way the Goodix
> touchscreen on it works is interesting. The controller needs to have
> firmware uploaded to it before it will work. After that it pretty much
> works 100% the same as any other Goodix touchscreen controller.
> 
> I've described this patch-set in the Subject as "Add support for
> controllers without flash", but I suspect that the Goodix controllers
> used on Bay Trail devices which ship with Windows pre-installed may also
> lack flash; and that the Windows version of the BIOS-es on these devices
> does the upload for us. Anyways just something which I'm wondering about,
> these patches are necessary to make things work regardless.
> 
> These patches should also be useful for supporting the Goodix controllers
> on some ARM based devices, as some of those need the OS to upload the
> firmware too AFAIK.
> 
> Note patch 7/7 is included to get an overview of the entire set.
> I'll merge that one myself through the pdx86 tree. Patches 1-6 are
> intended for merging through the input tree.

Self NACK for this series I just found out that the controller on
a Chuwi Hi13 gets mis-indentified as needing fw upload even though
that is not the case.  I'll send out a fixed v2 rebased on top of
5.14-rc1 once 5.14-rc1 is out.

Regards,

Hans



> Hans de Goede (7):
>   Input: goodix - Change goodix_i2c_write() len parameter type to int
>   Input: goodix - Add a goodix.h header file
>   Input: goodix - Refactor reset handling
>   Input: goodix - Push error logging up into i2c_read and i2c_write
>     helpers
>   Input: goodix - Allow specifying the config filename through a
>     "goodix,config-name" device-property
>   Input: goodix - Add support for controllers without flash
>   platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of
>     TM800A550L tablets
> 
>  MAINTAINERS                                 |   3 +-
>  drivers/input/touchscreen/Makefile          |   3 +-
>  drivers/input/touchscreen/goodix.c          | 239 +++++------
>  drivers/input/touchscreen/goodix.h          | 118 ++++++
>  drivers/input/touchscreen/goodix_fwupload.c | 437 ++++++++++++++++++++
>  drivers/platform/x86/touchscreen_dmi.c      |  21 +
>  6 files changed, 684 insertions(+), 137 deletions(-)
>  create mode 100644 drivers/input/touchscreen/goodix.h
>  create mode 100644 drivers/input/touchscreen/goodix_fwupload.c
> 

