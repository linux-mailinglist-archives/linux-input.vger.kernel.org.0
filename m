Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA7A45817B
	for <lists+linux-input@lfdr.de>; Sun, 21 Nov 2021 03:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhKUCZH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Nov 2021 21:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236578AbhKUCZH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Nov 2021 21:25:07 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A771C061574
        for <linux-input@vger.kernel.org>; Sat, 20 Nov 2021 18:22:03 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id t4so4700245pgn.9
        for <linux-input@vger.kernel.org>; Sat, 20 Nov 2021 18:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dcLX5XSyAj/Z/Yrsc0ArVVJPNOvo1GGT6lVIrGqLj3k=;
        b=FZYsjKkMFtA3yngT9XxzmB6an6BxsOv1PcveRaSID0XAqZ1it3EqzUTzGzsJHoVzEo
         1j/DHrF6hOlhknt+2M6o/Itgs1tIuZd4fLaDC7sSyJDdD8h5OwverqtWxX1z8H3AJ1Vr
         g4yyt2KE04jQ08YVF7raDNXsgWcC4yHYS68A2YzcScEl3jm6jF1R2WakeidyOdt8lv9w
         GttuCzXqqnkWeoxsCrNLZV3InxaL1tctX5D4t8/4uatsJTb/e3HYHj23CcZIoLvRwUdC
         YRgkKW2ykoX95q2e1cBoNywohTrY/BDou5UrvzYkqn+cVYemk8cK6qm8h62WNhkdPCKT
         fAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=dcLX5XSyAj/Z/Yrsc0ArVVJPNOvo1GGT6lVIrGqLj3k=;
        b=ySIi6C9U4ElnIyHgo3DPVhD9ZwfrJj+nhCiLfOHP84fBzEXMkkOn+WH1pFV771oCcA
         YOL/iRsYsjt34TovnHQQVBjzRfR0YqaI3Bkr762S2J1VlILXYkFOiMm/cx4MNWvTbnaG
         x7lFbECwW0VuLoVGN1gCGFLCipMJQcqQW88+5x6aIMGp+bdJnFtVuNofiNYyHTkOXrNC
         p1zRptE4ODkefgkOIDACSDM3eAQiPK7aYmFbTzpT2V7WJbRu5k6LhImlkfW+udhn05/c
         bKy7DUJa0rDiXfB0KOs2/4f9IIHWT9bHyFqts3We7GHlI3pnn35R1YXgfC/3waLNvllw
         qEmw==
X-Gm-Message-State: AOAM531KPqNZaBo1BDK3BKBwU8zvvnVeo/mBZma7pnPPK50kZeKOvaFy
        pscfXY+9b1pAIJwTuTI77XL4RlP/ob6UyAv+iG0=
X-Google-Smtp-Source: ABdhPJzxk7i9XXZXTO9AXkywAIIYTWd5u6uvC+9nKdvesVdHbMtswD553fgmUE3z8jURM823zb6RylhthQSlf5Sx8cI=
X-Received: by 2002:a63:914c:: with SMTP id l73mr4344824pge.184.1637461322492;
 Sat, 20 Nov 2021 18:22:02 -0800 (PST)
MIME-Version: 1.0
Reply-To: sgtkaylamanthey612@gmail.com
Sender: reineassibi403@gmail.com
Received: by 2002:a05:6a10:8c03:0:0:0:0 with HTTP; Sat, 20 Nov 2021 18:22:02
 -0800 (PST)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Sun, 21 Nov 2021 02:22:02 +0000
X-Google-Sender-Auth: gQnsD478MCJlNTeGBIYPxEFpTUs
Message-ID: <CA+j7dZpF_SmMUPAV7OJckq4erykjAiHa0BosmMaXOY5NwRuxdg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ahoj, dostali si moje dva predch=C3=A1dzaj=C3=BAce emaily? pros=C3=ADm skon=
trolujte a
odpovedzte mi.
