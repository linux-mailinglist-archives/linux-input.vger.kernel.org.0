Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D9E6E1CEB
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 09:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjDNHF6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 03:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjDNHF5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 03:05:57 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6BB30C7
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 00:05:56 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id my14-20020a17090b4c8e00b0024708e8e2ddso6885746pjb.4
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 00:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681455956; x=1684047956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmkf9QFdFyzfSWnSNt/NvX6EQh5bcL3lJ/ohLh+Ebis=;
        b=KwJidng39Z84drao94dtPrwkoPdmi1kE6dniL0EVRQ6wWKFso5Yl92L7GzY8Dzmc2f
         GhTZ1QaRwf/wjaLi6WvMZqW0CFyaw/xBJoXKDTCB3NAlLLZnMvfgK1pmj0fzD0zNmwPM
         SArZRwE+x89KfC/UWR+1fhL6CYy+LTg/kC0fg3hXP+eXdLlPJZRoKDEgonHT2NamC6uq
         1zewXDW1cLXIbNaasHBEDmbCSz0ptYH9WumxlhQaXUY+biu2udUtt2Cbl8qV3PsozgW/
         kQFaOEdSw/snh3uBSPFNoMu36//jq+uU+I47S/u/5vxkQqWystfWATmk6d/RemyMczOX
         ovqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681455956; x=1684047956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qmkf9QFdFyzfSWnSNt/NvX6EQh5bcL3lJ/ohLh+Ebis=;
        b=Nakf6f2Y1FV/eEFno/82lQMMBEKBJ50xaa789UX8cGGC1F2i4xhOR5bEYOV+ez08Af
         5cpL1Afsydac6qJ9pXe08UyV/NoQyXg+QCLyPg6BHxi2jCmpZGV5aJD4qFsj02qsrtAx
         wJPQ0JvgAy+RHGfiT8nwRZPIz4iJJMt+yJEnUvdbNRa9EB3MJtw0UDuaGFx8fmcdQPpR
         1JfeWY4euSK2XUfZ8A6NfTD3MCkKa/yLAREkd1QCkw1fEwuRnkqSNk5dB7/1g5TkSkbH
         Efu0MVOgzV8cyeqS7TCIFMERKdkoMmAtrpD2Tb/tZLTUgG2KyvR5wZIWQhta/2t4VmtL
         kBgg==
X-Gm-Message-State: AAQBX9eoqV1eU6GuBOczKDzwRKOx8o0RHkpbWo3IUIxZx91SjLlzBEAW
        7Sqfzm2iY0qL5ogb+UG6xZ0=
X-Google-Smtp-Source: AKy350a4QtQAsecrQBHKuX776frvJSxicUIqRTJQMjjC2s7gd1LQ7VL7zy5kAS3g0pVGSfkn/Xh4/Q==
X-Received: by 2002:a17:90a:7382:b0:244:af48:c4f3 with SMTP id j2-20020a17090a738200b00244af48c4f3mr4634806pjg.7.1681455956140;
        Fri, 14 Apr 2023 00:05:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5142:7eb2:ace5:60c1])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a948200b00246eea781b8sm2363065pjo.12.2023.04.14.00.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 00:05:55 -0700 (PDT)
Date:   Fri, 14 Apr 2023 00:05:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH v2 2/2] Input: xpad - fix PowerA EnWired Controller guide
 button
Message-ID: <ZDj7UIUv2EnK6SOr@google.com>
References: <20230411031650.960322-1-vi@endrift.com>
 <20230411031650.960322-3-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411031650.960322-3-vi@endrift.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 10, 2023 at 08:16:50PM -0700, Vicki Pfau wrote:
> This commit explicitly disables the audio interface the same way the official
> driver does. This is needed for some controllers, such as the PowerA Enhanced
> Wired Controller for Series X|S (0x20d6:0x200e) to report the guide button.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry
