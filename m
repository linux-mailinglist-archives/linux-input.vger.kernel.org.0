Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7F263F2BC
	for <lists+linux-input@lfdr.de>; Thu,  1 Dec 2022 15:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbiLAOYL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Dec 2022 09:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiLAOX7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Dec 2022 09:23:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4F25A6E0
        for <linux-input@vger.kernel.org>; Thu,  1 Dec 2022 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669904582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SR3PJdSecGTlAfxSaOagL/vi51rfippLgIgBQ/FaDaE=;
        b=TdRUtLzJ8kmn9uV9XrY1kWPSxLBm8vITm1qRgwKEUdbUH35Vz+TD+TIH0uhtUu6u9n42Vu
        j65NdaDHB+o8LElSl2gHdUX1RaCu5uy7iArPEdlPjkw5JiBUztzCffLmWgP8vBJFJkW527
        NnxjSpV+BMgQnWCQTfnSaZ1sUb6RL0g=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-4WPlMkYePwmNHFaHtv_H2w-1; Thu, 01 Dec 2022 09:23:01 -0500
X-MC-Unique: 4WPlMkYePwmNHFaHtv_H2w-1
Received: by mail-il1-f197.google.com with SMTP id i1-20020a056e021d0100b00303357fe402so2014555ila.10
        for <linux-input@vger.kernel.org>; Thu, 01 Dec 2022 06:23:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SR3PJdSecGTlAfxSaOagL/vi51rfippLgIgBQ/FaDaE=;
        b=7wNMyzIWZJj4vvUercaSDnmi9Fc3tUFfP8zV3tl1CoAssVhVT3UKuRl3/6bhb7V5um
         b2QOHcv/CEeLziqGIO6BIQf+PFJvGmNFqrZFqCZnUfZQV/SYDGLaz6/h6yumF2IAgAKR
         OKiey7YlSDWJOUAeZ2gZLn0glVAd7oq3fnNr53VCx26x2yIAO06FCqUDOAyz1FK5HFf5
         jTLVgrnOtGwQAxrNV58I4HvMrL2uh51pwe3f6UNxhDSjt9k2ZshAfRy8QHfORY/IrGu0
         W4jP+w3bpRxtMRGQfeN8Tu/KPV7vJow0yq+wajrKAW8idqMk7mBkmNtppD6O6SBVQFvJ
         WFMw==
X-Gm-Message-State: ANoB5pnMxJzyMfwDvOkUOMAFcLASHycsWxpWpXX9iV5/YWoESWRhWVDY
        j8bdje/BnIVk+4VNgkg5wEPzaVDAR1yUeqOYk+DiSeqL1X7VdLyF/iEjZpqDC9v8DLbx1wrbeFi
        jWtQF5U+VP90jEtx4R2rcO0UA2Z68XpBPLZU2f6o=
X-Received: by 2002:a5e:a50c:0:b0:6d6:3d7e:1592 with SMTP id 12-20020a5ea50c000000b006d63d7e1592mr23083923iog.37.1669904580888;
        Thu, 01 Dec 2022 06:23:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6UOMtL67lyuuojepWXWGsO32EdrrACTmKXZEWXhiFXcsj1p4iedeexv7JjuuFnyi1+VrfIaSAHk9jJ5rYarS0=
X-Received: by 2002:a5e:a50c:0:b0:6d6:3d7e:1592 with SMTP id
 12-20020a5ea50c000000b006d63d7e1592mr23083910iog.37.1669904580642; Thu, 01
 Dec 2022 06:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20221124151603.807536-1-benjamin.tissoires@redhat.com>
 <20221124151603.807536-2-benjamin.tissoires@redhat.com> <CAEf4Bzaq3QfhzqQK=BqCkzNcoS3A5L-ntJ5vj16uMc=jS4bxkw@mail.gmail.com>
In-Reply-To: <CAEf4Bzaq3QfhzqQK=BqCkzNcoS3A5L-ntJ5vj16uMc=jS4bxkw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 1 Dec 2022 15:22:49 +0100
Message-ID: <CAO-hwJKwDWJ6ZKK=+BjrDhjfyG00VKFznJ+HO-0MV1AQ1U8D-Q@mail.gmail.com>
Subject: Re: [RFC hid v1 01/10] bpftool: generate json output of skeletons
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 1, 2022 at 12:06 AM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, Nov 24, 2022 at 7:16 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > So we can then build light skeletons with loaders in any language.
> >
>
> It would be useful to include an example generated JSON. Other than
> that the overall idea makes sense. Kind of machine-friendly "BPF
> object schema" to allow automation.
>

Great :)
I'll add the generated example in v2 then.

However, I have problems figuring out how I can hit the
"codegen_datasecs()" path. I think that's the only code path I am not
duplicating from the do_skeleton() function, but I don't know what
kind of .bpf.c program will trigger that part.

Also, should I add some tests for it in tools/testing/selftests/bpf?

Cheers,
Benjamin

> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > ---
> >  tools/bpf/bpftool/gen.c | 95 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git a/tools/bpf/bpftool/gen.c b/tools/bpf/bpftool/gen.c
> > index cf8b4e525c88..818a5209b3ac 100644
> > --- a/tools/bpf/bpftool/gen.c
> > +++ b/tools/bpf/bpftool/gen.c
> > @@ -904,6 +904,96 @@ codegen_progs_skeleton(struct bpf_object *obj, size_t prog_cnt, bool populate_li
> >         }
> >  }
> >
> > +static int gen_json(struct bpf_object *obj, const char *obj_name, size_t file_sz, uint8_t *obj_data)
> > +{
> > +       struct bpf_program *prog;
> > +       struct bpf_map *map;
> > +       char ident[256];
> > +
> > +       jsonw_start_object(json_wtr);   /* root object */
> > +
> > +       jsonw_string_field(json_wtr, "name", obj_name);
> > +
> > +       jsonw_bool_field(json_wtr, "use_loader", use_loader);
> > +
> > +       /* print all maps */
> > +       jsonw_name(json_wtr, "maps");
> > +       jsonw_start_array(json_wtr);
> > +       bpf_object__for_each_map(map, obj) {
> > +               if (!get_map_ident(map, ident, sizeof(ident))) {
> > +                       p_err("ignoring unrecognized internal map '%s'...",
> > +                             bpf_map__name(map));
> > +                       continue;
> > +               }
> > +
> > +               jsonw_start_object(json_wtr);   /* map object */
> > +               jsonw_string_field(json_wtr, "ident", ident);
> > +               jsonw_string_field(json_wtr, "name", bpf_map__name(map));
> > +
> > +               /* print mmap data value */
> > +               if (is_internal_mmapable_map(map, ident, sizeof(ident))) {
> > +                       const void *mmap_data = NULL;
> > +                       size_t mmap_size = 0;
> > +
> > +                       mmap_data = bpf_map__initial_value(map, &mmap_size);
> > +
> > +                       jsonw_uint_field(json_wtr, "size", mmap_size);
> > +                       jsonw_uint_field(json_wtr, "mmap_sz", bpf_map_mmap_sz(map));
> > +                       jsonw_name(json_wtr, "data");
> > +                       print_hex_data_json((uint8_t *)mmap_data, mmap_size);
> > +
> > +               }
> > +               jsonw_end_object(json_wtr);     /* map object */
> > +       }
> > +       jsonw_end_array(json_wtr);
> > +
> > +       /* print all progs */
> > +       jsonw_name(json_wtr, "progs");
> > +       jsonw_start_array(json_wtr);
> > +       bpf_object__for_each_program(prog, obj) {
> > +               jsonw_start_object(json_wtr);   /* prog object */
> > +               jsonw_string_field(json_wtr, "name", bpf_program__name(prog));
> > +               jsonw_string_field(json_wtr, "sec", bpf_program__section_name(prog));
> > +               jsonw_end_object(json_wtr);     /* prog object */
> > +       }
> > +       jsonw_end_array(json_wtr);
> > +
> > +       /* print object data */
> > +       if (use_loader) {
> > +               DECLARE_LIBBPF_OPTS(gen_loader_opts, opts);
> > +               int err = 0;
> > +
> > +               err = bpf_object__gen_loader(obj, &opts);
> > +               if (err)
> > +                       return err;
> > +
> > +               err = bpf_object__load(obj);
> > +               if (err) {
> > +                       p_err("failed to load object file");
> > +                       return err;
> > +               }
> > +               /* If there was no error during load then gen_loader_opts
> > +                * are populated with the loader program.
> > +                */
> > +
> > +               jsonw_uint_field(json_wtr, "data_sz", opts.data_sz);
> > +               jsonw_name(json_wtr, "data");
> > +               print_hex_data_json((uint8_t *)opts.data, opts.data_sz);
> > +
> > +               jsonw_uint_field(json_wtr, "insns_sz", opts.insns_sz);
> > +               jsonw_name(json_wtr, "insns");
> > +               print_hex_data_json((uint8_t *)opts.insns, opts.insns_sz);
> > +
> > +       } else {
> > +               jsonw_name(json_wtr, "data");
> > +               print_hex_data_json(obj_data, file_sz);
> > +       }
> > +
> > +       jsonw_end_object(json_wtr);     /* root object */
> > +
> > +       return 0;
> > +}
> > +
> >  static int do_skeleton(int argc, char **argv)
> >  {
> >         char header_guard[MAX_OBJ_NAME_LEN + sizeof("__SKEL_H__")];
> > @@ -986,6 +1076,11 @@ static int do_skeleton(int argc, char **argv)
> >                 goto out;
> >         }
> >
> > +       if (json_output) {
> > +               err = gen_json(obj, obj_name, file_sz, (uint8_t *)obj_data);
> > +               goto out;
> > +       }
> > +
> >         bpf_object__for_each_map(map, obj) {
> >                 if (!get_map_ident(map, ident, sizeof(ident))) {
> >                         p_err("ignoring unrecognized internal map '%s'...",
> > --
> > 2.38.1
> >
>

