Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A956D9BA4
	for <lists+linux-input@lfdr.de>; Thu,  6 Apr 2023 17:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239574AbjDFPEW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Apr 2023 11:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239224AbjDFPES (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Apr 2023 11:04:18 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE239764;
        Thu,  6 Apr 2023 08:03:53 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id f4-20020a9d0384000000b0069fab3f4cafso20836811otf.9;
        Thu, 06 Apr 2023 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680793431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVy9ZCpV7/gFCLRm9iZKSvWvPfNvxYktDIa8G4cY51w=;
        b=gA9lM1P8ytYnMTMjjdPRyGullix8jlrDTR+rutwGcVVjh+d9GQJIRbVc24n4lWBWj7
         ckmzJczFazSttWR+/IEELLPbm1sKibImGtgCf8j/8rCEQCWODO6hl8U7UyEqbgkZj4fD
         49uIPmsej+92gmY1dt58mzPyHIIY0m7ARf6v+co0asntoBGbwznpqKQ1o9i9M9bxge/p
         WTAL46MKu0pC87sC7QNep6o344cEgMDgJ37WCCgyFpXMEIWFTp5pUDLhf5oxMS+2lZfW
         BeE+32b43z6dZ+ZWzEK4BWrHXPoTzFtrUY3MAJ+/qgg9GjWSuvLvB3fgerc3YeRUkRn9
         47WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680793431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVy9ZCpV7/gFCLRm9iZKSvWvPfNvxYktDIa8G4cY51w=;
        b=zrzrxa3zR0W6kkA4wkntR7WwPdpmC0ZMyCKmLRzrDjHmBvgSQ5pzc6wUfrGvehkLD+
         x1J8nii/fo3tgFy1Vv3pFuKc8fylE8dqowddoEcwz5yoPLloi8BSWtPrVdmzZHPfbvVM
         Z9WT2M2cv0TQtwQn6ZbgaMjGoQat9/8AQwrDgQWUwMIA+zjF0UYbYFXK682uIKixGzVM
         nvpMlLQCG3AQ/T++wPoPB+6E+QXnIIh6iC9zmdhxl4+usIe0rK/w7/aQ6Iww7o/kybk5
         ef5+BYiJ8kJnDwBJAmkGcYS7rwbPypXeqM1vrj0fS0NF6LiY4iy+oK7FTppq8sRf1Rh7
         jSRA==
X-Gm-Message-State: AAQBX9dYpFI1QRp16ZnBIFPoZrshkJ9Fbmxt/r4o68xeVk4ndjKSsW8W
        tZX+LLZffsPRJb+tnFKiMe6zNkshB5y14bWycwk=
X-Google-Smtp-Source: AKy350avDKOwDklBz/ABSRh4K51FlXy3ROpQNOsEneDMqd8mG1yI2ODy6rzsXl7AEcBDNg6x6SX2ru6NcKsfIoL5aH8=
X-Received: by 2002:a9d:5c06:0:b0:68b:c94d:bbf7 with SMTP id
 o6-20020a9d5c06000000b0068bc94dbbf7mr3238799otk.0.1680793431219; Thu, 06 Apr
 2023 08:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230329014559.44494-1-kallmeyeras@gmail.com> <20230329014559.44494-3-kallmeyeras@gmail.com>
 <a24153ed-fafc-0e73-1db1-35168464b973@redhat.com>
In-Reply-To: <a24153ed-fafc-0e73-1db1-35168464b973@redhat.com>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Thu, 6 Apr 2023 08:03:42 -0700
Message-ID: <CAG4kvq_N5MtBvcBeRUFVxfMhaKXpMoUO+GO6XEwSbirJZSNfng@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org, Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 6, 2023 at 3:34=E2=80=AFAM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi Andrew,
>
> Thank you for your patch. I have merged this now,
> with tiny code cleanups squashed in.

Thanks for all the help Hans, and everyone else too! I thought I would
need to send another patch version tonight, but I'm glad to hear this
is getting merged!

Thanks,
Andrew
