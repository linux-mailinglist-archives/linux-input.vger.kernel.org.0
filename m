Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7265F2536
	for <lists+linux-input@lfdr.de>; Sun,  2 Oct 2022 22:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJBUMk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Oct 2022 16:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiJBUMk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Oct 2022 16:12:40 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46F338458
        for <linux-input@vger.kernel.org>; Sun,  2 Oct 2022 13:12:37 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id y144so3928808yby.11
        for <linux-input@vger.kernel.org>; Sun, 02 Oct 2022 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7LZI+6XQP+2aW8mi1M2eNM6MF/Jv9AWVYs9qfMeLOfc=;
        b=XH67toruRhNFb4IxqvfdjsEo0pXKmntDrggiO5iRXz0xLTvy9mdD2aHTt/e2pa/yua
         4HRXvihcY/mnUF0SzH7DzrIT0Ivzw9dw0hMDReJIisZFBhVBGCYpesbvnO++1gBSJDqI
         /hy3EI0f6BLnQ50/ZQYa54A8YJPRT2HmkUp6N2J9pzxi4CkDJUl8xuccdu2iQVkg1yYi
         j7Hqf9uJRIix7ZJ5mVh43C6O4WPoMmRFyCWPgayefzkxw03kfWptbN8R/ngfniFOJWMt
         WrOjLJZXdpSsIzgDhoUXjA2IzJKBneFmTmjwS22D761R79VzPHropFkarIl1d9G+I56l
         N3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7LZI+6XQP+2aW8mi1M2eNM6MF/Jv9AWVYs9qfMeLOfc=;
        b=MDxl4qVnl2iPi5rIPG3s5a25+ARtZu3K58XosOKZ4w+Sf1rHd0de9djmd0TfO5gQAC
         hY0+yeLr+pz6usCWyk00oCGUIHsneIlxRAG9/SJ6aUiKycSHShRYGLoi6hpmrOgEQwON
         bHIsnfHhNhx/DyYmrDZ3XkU3LZWMiGHwz3vsBritMdc227++tosdsDh3weS0NPb76Vr5
         Nn4mfrKBZ9KeAjA4U/9YJ4dq/7tqUZPdOZ6RuQu+Hd6GbnOu4uxC55sPi5+c9ht0wmwA
         DtDy4q+wcYSq0G+JrIdOlQi++igX0A5CdlS0/KVueOsAftvL9PrM6YA5Wdj346vdeoIS
         zyvw==
X-Gm-Message-State: ACrzQf2cWjgHK6P+PgY2dSsAa3IjDzqoOKJs+qiOOryFGR196ffbR+Yl
        LVWdVK3VyBb3jeChTY1zY21iPTFPDZYCpcjSnHEuxjZ2
X-Google-Smtp-Source: AMsMyM7grcym9ew0y6M9iAVkJtLDncyzAgushsyvk5gUQdCHo59RTDZApTk4LeWt37iop5vWtDsWhSsF2AHEJLZOvfg=
X-Received: by 2002:a5b:347:0:b0:6bd:39b:3214 with SMTP id q7-20020a5b0347000000b006bd039b3214mr10383086ybp.572.1664741557077;
 Sun, 02 Oct 2022 13:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAEc3jaC1jkoXEZWJOod9WH9+quSta0tUzow4YuKWKxjACGWV6Q@mail.gmail.com>
In-Reply-To: <CAEc3jaC1jkoXEZWJOod9WH9+quSta0tUzow4YuKWKxjACGWV6Q@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Sun, 2 Oct 2022 13:12:26 -0700
Message-ID: <CAEc3jaA5FKo4pRqJEihxY7euAkA0utqr=tfMw-6ZEkD0biaP7A@mail.gmail.com>
Subject: Re: hid-playstation race conditions during probe failures
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Never mind, it was my own fault. Was essentially returning a positive
errno value (bug in new code) and hadn't realized probe had actually
succeeded due to that instead of failed.

Thanks,
Roderick

On Tue, Sep 27, 2022 at 9:53 PM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Benjamin and Jiri,
>
> I'm doing some work around hid-playstation and as part of that I
> stumbled on some kernel oopses, which I at first couldn't explain. I
> believe I understand the problem now, but I don't know what the best
> fix is and if it is completely my driver.
>
> The basic summary is that hid-playstation relies on associating custom
> data with the device using hid_set_drvdata during probe (in
> dualsense_create to be exact). When a probe call fails (one of the sub
> paths of dualsense_create), there is currently an undefined pointer
> associated with the hid_device.
>
> What seems to happen is that raw_event (ps_raw_event) still gets
> called while in this undefined state. I don't fully understand this
> well, but it is because the driver has to perform some get feature
> requests and had to open the device.
>
> Is my understanding so far correct? If it is, my driver has a race
> condition. The ultimate issue is raw_event, would it need to do
> something special (e.g. looking at some flags). I can also delay
> calling 'hid_set_drvdata' closer to successful setup (a little hacky
> perhaps). Or is the issue and fix something else?
>
> Thanks,
> Roderick
