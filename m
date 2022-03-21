Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A15D4E263D
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 13:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347298AbiCUMXH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 08:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347027AbiCUMXG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 08:23:06 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56343165A9B
        for <linux-input@vger.kernel.org>; Mon, 21 Mar 2022 05:21:41 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2e612af95e3so41437117b3.9
        for <linux-input@vger.kernel.org>; Mon, 21 Mar 2022 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=O4U5RsJ8Vgyrrgzz+zKRhGp6VOIohrgLMQU0iG131os=;
        b=g53hvByEGpmaN3T/mUV2Y+l9CTEtNrnOYIzsRhX4qLihV+OOumbzB4Rp0flVTds/sG
         HSblzDWY87Wpw9hXbUEZQ8/1y0MzELDPZOHqwpG3ro7aL4rhErdlMeJjApiVQAyqApm5
         xfauCzon8+hV/hH1sJuuy+DUtzUh7/NO3efS4XcCvzIL+qnjmt+vXBNYJu97slx6Ab4O
         D/Z1L98aCsMDOAz9Y59S//3TXft+ODKAh840O8LWzA9y1bnwz5bpjz52Z22MHNskKNUc
         aUDPI79dG5a/ZtVpaVUEGSPxiJvzSHGJjzHIZDhXqUcKzUD2NztJje3VDYEG+9+AL90O
         1G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=O4U5RsJ8Vgyrrgzz+zKRhGp6VOIohrgLMQU0iG131os=;
        b=euXch8mjXUnkOH1C+nkxxV6yOtsBmeD2kJUePFkkFC/e3T7BYEKzp2uQxOePNTgHnq
         nM/a2xGK+yLGG0fMMJHJA9XhC/zMLL4GrwG4BGL5TxSNYj1vqHgUrOQXQ9fZWp56jsnL
         AQr2Vr5E8zG59mBLL5w3HGuNEG/1CW0iexlyBaqB/v0qUaaJhEizufli+umk0IlURCZf
         m3+vi3Z6Dfo2tpa7ly5cY0uFEmfcNYrImbHHOWDmNy3bld33Ld8PrkaSzadMqRJSQZz9
         o7TBSBpysIS6ADBwzOVtCGvY+qAE9yx9KeTsHD4x+Uk5qIYLQV7EDsJTcMw9bC7LN2c4
         DMZg==
X-Gm-Message-State: AOAM5306J/4shQesLzXiF4GwIc8peK04049ebZOW0TxPQoAZwfpTK1Cn
        5DywjqPFb0RbvwEq8I8xSUugxXVpjlF/vLj999rPsyIFXT8=
X-Google-Smtp-Source: ABdhPJwdX0Ke8OqORaPfKO9j3FY4VJUiHqMNN3O1TCocefJOLpv0etkajXWIcMBdk65BjH+M+zw91RhEegwtmTMJ67A=
X-Received: by 2002:a0d:f602:0:b0:2dc:6eaa:64 with SMTP id g2-20020a0df602000000b002dc6eaa0064mr23116193ywf.451.1647865299756;
 Mon, 21 Mar 2022 05:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAEwRq=rSgqcQnWQ+Z29wJfOnT+ri8b25+hwheQDPBe2REOpxww@mail.gmail.com>
In-Reply-To: <CAEwRq=rSgqcQnWQ+Z29wJfOnT+ri8b25+hwheQDPBe2REOpxww@mail.gmail.com>
From:   Vincent Legoll <vincent.legoll@gmail.com>
Date:   Mon, 21 Mar 2022 13:21:28 +0100
Message-ID: <CAEwRq=r5f5dLMkuPbrj+3d5k3y3n4OX1B0JaoE=GYUkVH7YF_g@mail.gmail.com>
Subject: Re: Quirky Perixx Periboard-520 USB keyboard + trackball
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

On Sat, Jan 22, 2022 at 1:52 PM Vincent Legoll <vincent.legoll@gmail.com> wrote:
> I just don't really know where to start.

Any help / hint / pointer / doc ?

-- 
Vincent Legoll
