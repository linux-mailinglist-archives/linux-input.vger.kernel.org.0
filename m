Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E14154FAD
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2020 01:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgBGATt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 19:19:49 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33530 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgBGATt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 19:19:49 -0500
Received: by mail-pg1-f196.google.com with SMTP id 6so186306pgk.0;
        Thu, 06 Feb 2020 16:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4ULN0dOs41v4AFU42LCYrXImvmGcJJ+nEhgWQs+WaF0=;
        b=Jb02RUjCRO1WBhEXD4M45oPkWbA8RdtMVLeiXMh2bOl/o3kwwLYv80KWHyaSE9fR4u
         QQBry5cF6Uq0feJiazpbf+nLeaFpAqIx4XrYLuntlMphAKBhTNqUx+bxokhLjXKCeqx6
         HQ1dfL9VNIUVBE3/Do4995JnC6VJU4DWeXNDunW3R5+Fxxs2OwBIlyFjKRbo+Lh5NF4h
         yUz/m2RodCTa7UnmEpmet8hpagPRrcRCtAGj4YpPJ8q8BcQsw3TM5aBOrQIBY0a7eui9
         0BdibrDv+cAeF2Q1gOnZ6Dw0He0aO7QbghbTZn24rA2AAsMoH6a3LRHCo00+/l0JfqHj
         G/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4ULN0dOs41v4AFU42LCYrXImvmGcJJ+nEhgWQs+WaF0=;
        b=JOE/uB0WJ4NfHBKLyWwt2W93062Ep2Y/BOtzMfsbvk7BGA1/ns0L2qyHm4xAQvN48Z
         qLzoKa2ihzAxJK3UEQ9fm7QNPAmZy+QlQA3KO+BwqBQ2Jt5tT2nn+/er3WqodVlclKoz
         rEj2HCb6BWPkImLRlBezr5C6elaEZkbhQqBUqtBElFaFw6L/Sp0c8aweElQtbz2AghiG
         pRsIz52Mu+gsoLaVQea7P5WXbjadQa/mI9siujd6EXzvYteqarNCbb0a3bSG6QXXoeh6
         xQENOoJOnSKFnFDXF5m7nstVfG5lPYYDsoHH7pyK0a3iVpr6ByyOmYFgRK2Oex7PdctB
         gt/g==
X-Gm-Message-State: APjAAAWP24ZDp3UaGtx3MmY+kd6VLQ0q2W+Hwnr+Tvj4X6j/EiUZfpHy
        Q6rexQCSkmqZSweWDYXHNVs=
X-Google-Smtp-Source: APXvYqyVKoCLhy2pjZELtPe821UwLoUgy5d1FWUfDJpW3OdBUDzmV+PG1SctoF4qWmiL58YIM0F4OQ==
X-Received: by 2002:aa7:96c7:: with SMTP id h7mr6627072pfq.211.1581034788765;
        Thu, 06 Feb 2020 16:19:48 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z64sm541925pfz.23.2020.02.06.16.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 16:19:48 -0800 (PST)
Date:   Thu, 6 Feb 2020 16:19:46 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>, robh+dt@kernel.org,
        mark.rutland@arm.com, megous@megous.com,
        mylene.josserand@bootlin.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: touchscreen: Convert edt-ft5x06 to
 json-schema
Message-ID: <20200207001946.GI184237@dtor-ws>
References: <20200206101434.30209-1-benjamin.gaignard@st.com>
 <20200206215322.GA12956@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206215322.GA12956@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 06, 2020 at 02:53:22PM -0700, Rob Herring wrote:
> On Thu, 6 Feb 2020 11:14:34 +0100, Benjamin Gaignard wrote:
> > Convert the EDT-FT5x06 to DT schema using json-schema.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> > version 2:
> > - preserve formatting in description
> > - use 'const' rather than 'enum' for reg property
> > - fix max/min issues 
> >  .../bindings/input/touchscreen/edt-ft5x06.txt      |  75 -------------
> >  .../bindings/input/touchscreen/edt-ft5x06.yaml     | 123 +++++++++++++++++++++
> >  2 files changed, 123 insertions(+), 75 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Unfortunately this does not apply as the latest binding was extended to
document "wakeup-source" property. Could you please refresh against
mainline or my tree?

Thanks.

-- 
Dmitry
