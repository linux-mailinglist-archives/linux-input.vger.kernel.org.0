Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD40ADCAEF
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 18:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436611AbfJRQXt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 12:23:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37606 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbfJRQXt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 12:23:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id g21so4057956lfh.4
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N2wi/OP6d586EjQAloFweW5u491ag8tawEzsEIxjYjU=;
        b=gWAXdHWezuL7R7MxC2NfJ3S5dFAkcyD/B3wZtCJhaIwbxT+AtYrGGZXYT3PYNaHZPN
         aNxBbzbwcOq5SXNumdwzY4Rf7WSbUPl08miDtH5aWH0SIwtzB/sHoV/tqp9PjY0RJ0k4
         2K+dxm8DfDwbQZ3d5xTscF4fOiP4QI1r+Pl/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N2wi/OP6d586EjQAloFweW5u491ag8tawEzsEIxjYjU=;
        b=eGe9jcnS7W0QsujdoFEefEtK3HhUTuhP1rhteaIMrViQXUsjGCtMF/TnxBfb7CY+w8
         WAR6VY5+EKt61yCLOHnXGGW61NWWsFVjZSeD8/gTW0W8Wv7XIp7rDzBUf5S+BQvSvNaV
         G+KXpypmp8zGzoFl/wGgxX5YqzP8amVAqgGQsV+4tmAwevG+UoJg9+ElTq7Bh639jrpi
         +N2Bfru0gfqr+UvyEjzaAQ3uNX8f+5I8G/XIP+i30NUogfaWOOIev2eOurvChzeY9Ekr
         UJwlqnr9tEtw2b6t37h6WWmWoTCZL1OcOoKpEesOY6qEtfkd10PBznjMC7t61ILcci8Z
         dQmA==
X-Gm-Message-State: APjAAAUJKt3TnK1mpvEV8QcaL/8TxttWDz8IXa5U1ovZZMkcPb5X7m/B
        ep1PevgE+QlcjQ/g+iSiJD7VsB/OHsM=
X-Google-Smtp-Source: APXvYqzKcqsI2bU97JIyZz/eb58BUqke5aJaLF4HNivWxoxxSsrvMaHuAJaOX7LqmQmgkKm4cRaRAg==
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr6183195lfm.15.1571415826243;
        Fri, 18 Oct 2019 09:23:46 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id b67sm7135663ljf.5.2019.10.18.09.23.45
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 09:23:45 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id l21so6839505lje.4
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 09:23:45 -0700 (PDT)
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr6983552lja.24.1571415824724;
 Fri, 18 Oct 2019 09:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191005101345.146460-1-ikjn@chromium.org> <CAATdQgBQiFnP3+Dtz8EGCRNiCOWRoJ+zK25iESNLPmVJ+exPmw@mail.gmail.com>
In-Reply-To: <CAATdQgBQiFnP3+Dtz8EGCRNiCOWRoJ+zK25iESNLPmVJ+exPmw@mail.gmail.com>
From:   Dmitry Torokhov <dtor@chromium.org>
Date:   Fri, 18 Oct 2019 09:23:33 -0700
X-Gmail-Original-Message-ID: <CAE_wzQ-E0qZJj4KwV51k5b6nT1PmOsVsR3GM+i-D5f_34qy1NA@mail.gmail.com>
Message-ID: <CAE_wzQ-E0qZJj4KwV51k5b6nT1PmOsVsR3GM+i-D5f_34qy1NA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: input: Add DT bindings for Whiskers switch
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

On Thu, Oct 17, 2019 at 8:10 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> A gentle ping on adding DT binding for Hammer (1/2).

DT bindings need to be sent to devicetree@vger.kernel.org and Rob
Herring <robh+dt@kernel.org>

Thanks,
Dmitry
