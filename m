Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F40966F42DE
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 13:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbjEBLfb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 07:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbjEBLf3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 07:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D89D90
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 04:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683027284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lK9qsgMO19zBq82l3bg+w3WuX7IjfDeJ2uNZ+xfD+lw=;
        b=S9tF2JikkKIwOBO/WNkAWhpny34BOVEPQQ/gHqVJO1i4lRH+WJ7MZKdigAfxToMoTJWWS2
        urdNqa1PQLufL4vSchM2YjEydcS0IA82aVn7ljQ08vpogHndSks+CWIQfREh8LpOURyr9d
        Jn0UAOUg/AJqIbvWyLNLbSVTFZqeAWY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-kMBKFonXPKu7C7FE3Y8Aww-1; Tue, 02 May 2023 07:34:43 -0400
X-MC-Unique: kMBKFonXPKu7C7FE3Y8Aww-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-306286b3573so1678082f8f.2
        for <linux-input@vger.kernel.org>; Tue, 02 May 2023 04:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683027282; x=1685619282;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK9qsgMO19zBq82l3bg+w3WuX7IjfDeJ2uNZ+xfD+lw=;
        b=ieDBkMWaNR6rz+NVlKrl/rued5MK9fio4aGJmJhpzMvX3nYsiUFGe6nemryM1299b0
         dQbq29vc3kqSGPbdIvDHbM+Eu14Um7sgx040bUeJ1kZcvpwnXC8WSuEiupSoUYeIs2ce
         XTuZNfB+Asbojw9tfA5yGLW1iSWdfTBYJZejLMSXejiBCn7KADLkJYnW4LS911/QJkxD
         Pan77j8r03DmGw04vJOs4eluqWYqJ6tPUgNJteriT6XG6sEEv6N9zEte3IA0Thvk/BgX
         xM1c4YNEk7F8oNEEC1OxNUAfiWTUt4YDakXa6xHciOgev5vs46i3J7eK0AkDW3epIHJM
         W9RQ==
X-Gm-Message-State: AC+VfDyYAhRL15x3ox6h4o1zgCwXdjSeNUdkVVm8087h+2eywbF70luu
        az2qOrQmQxiN/ig3qwJ4C+LZ9xyDENLBmn054nLX4Mjy+VsOnWGO6Az2SpD+to/76FsD5BAcPSS
        M9eEeXWyvBmB1lloMUisH8Rk=
X-Received: by 2002:a5d:6a45:0:b0:2fe:fd61:6426 with SMTP id t5-20020a5d6a45000000b002fefd616426mr11687250wrw.11.1683027282208;
        Tue, 02 May 2023 04:34:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RMusZykdrqpvGbSu8xbtR8yrdyW4pwr3uU+vuzXdiFHZ9djwSyuPHdmMLi+0c5JNiHQwJcQ==
X-Received: by 2002:a5d:6a45:0:b0:2fe:fd61:6426 with SMTP id t5-20020a5d6a45000000b002fefd616426mr11687229wrw.11.1683027281880;
        Tue, 02 May 2023 04:34:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p17-20020a056000019100b002fda1b12a0bsm30895708wrx.2.2023.05.02.04.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:34:41 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <davidgow@google.com>, linux-input@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: tests - modular KUnit tests should not
 depend on KUNIT=y
In-Reply-To: <CAMuHMdWA7R7NrS-T8x4qA3tn59zmZS8w20f1UyTw-R53iryeTw@mail.gmail.com>
References: <cover.1683022164.git.geert+renesas@glider.be>
 <483c4f520e4acc6357ebba3e605977b4c56374df.1683022164.git.geert+renesas@glider.be>
 <87ildbx9or.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWA7R7NrS-T8x4qA3tn59zmZS8w20f1UyTw-R53iryeTw@mail.gmail.com>
Date:   Tue, 02 May 2023 13:34:40 +0200
Message-ID: <87cz3jx8z3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Tue, May 2, 2023 at 1:19=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> I've only been Cc'ed in patch #2.
>
> Not really, you're in the To-header on the full series?
> https://lore.kernel.org/all/cover.1683022164.git.geert+renesas@glider.be
>

Strange... I only got patch #2, neither patch #1 nor the cover letter.

For patch #1 as well:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Sorry for missing that bug and thanks a lot for fixing it!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

