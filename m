Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA2951C57A
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 18:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbiEEQ7a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 12:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiEEQ72 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 12:59:28 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123C136334
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 09:55:49 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id n18so4953359plg.5
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rzFbIKFzb/rej6PRMv6lqFtJ/tzi7o3TWdLLpKqkQAk=;
        b=L4C1xKDxGckCZtTNOZKMeOqhzVcfjMcFke0n/ft5qUa4O9kiq/SjEKcjM4lGc7ALSp
         L9zezUwQnMaxEq5YGfPnNU1MttN8zsGcfG95JzNmSTYnS9m35yHcM3q4CGKTCXFkUxir
         97/xqoYhhZ8kBX70dXJfJji1yhcGzppCFHmnSOGzuf4OX/eiTH9Uqb0k/Ifdm9DBfZmc
         9wnq/k5QltpuaA+v4HR5kgUHbxccaPX4AQ4YYQSlDMhGgi8zWSwbp/7faLXTFUNM9rke
         aFHdenI/lYmGRsoEKn71TorE6xCBfqJEMfllz7yVubJvEIIpcEPysNwfbAXxRFjEkUBh
         b9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rzFbIKFzb/rej6PRMv6lqFtJ/tzi7o3TWdLLpKqkQAk=;
        b=At34yo9tVj7HKr1n0kX2U5gte1Y9EAM5NudlkrP9v5/SPTgKiCuPrZ6hkv6d20sB8w
         hokeb6iZgIAur3Rfl/+5GUhJp29PD46/XENYsxv0iGeDB4R7th3GI9DAHy4wYJU5EKhb
         3e09qeG+30Bkong2y3823P1PAxaI+wLS3wYw6dbYlmf60oBfaVmw+e2so3SgWdg70eR3
         WSOTdWNeT+Eol9iRWpCCf9mmmH8JXddXERAH6ZSYDQjauDqhBfoQqt3tOPxixClLX3rB
         LeHFbS7xk2KJxb5TPmtPBXfNO/WyKkGlEZ/B8YsAGYGinrkhqUCpO2GJPnkkk9WlfSw7
         GMAw==
X-Gm-Message-State: AOAM533zuHBQqs5fcg8VL7ONl3YG5fj3+u5bg8Ip01CM0XFEUpMllAa9
        nx2Sd/fP54jlDIFzOAzemghqaHL1gt8=
X-Google-Smtp-Source: ABdhPJz3BpAqG86d+bFWIsIag7Hh74caqu82NncvDP2c0y/MbOi12PN4nXraJHcHTcEF1EA9JbAMwQ==
X-Received: by 2002:a17:90a:2e0d:b0:1c9:b839:af02 with SMTP id q13-20020a17090a2e0d00b001c9b839af02mr7122456pjd.122.1651769748305;
        Thu, 05 May 2022 09:55:48 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:925d:ea91:88dd:e04b])
        by smtp.gmail.com with ESMTPSA id br11-20020a056a00440b00b0050dc7628151sm1592123pfb.43.2022.05.05.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 09:55:47 -0700 (PDT)
Date:   Thu, 5 May 2022 09:55:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Vicki Pfau <vi@endrift.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
Message-ID: <YnQBkd5V3lmC9cGr@google.com>
References: <20220427224526.35657-1-vi@endrift.com>
 <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 05, 2022 at 10:50:24AM +0200, Benjamin Tissoires wrote:
> Hi Vicki,
> 
> On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> >
> > This allows the touchpad input_dev to be removed and have the driver remain
> > functional without its presence. This will be used to allow the touchpad to
> > be disabled, e.g. by a module parameter.
> 
> Thanks for the contribution.
> I'd like to hear from Roderick, but I have a general comment here:
> We had Wii and Steam controllers following this logic. Now we are
> adding Sony PS ones... That seems like a lot of duplication, and I
> wonder if we should not have something more generic.

Hmm, if userspace is not interested in data from an input device (and it
does not want to simply not open it), it can use inhibit/uninhibit sysfs
attributes to silence it.

I am not sure we need to build support for destroying input device or
introducing module parameters, etc.

Thanks.

-- 
Dmitry
